function resaveModelsInDir(flags)
% 
% This is Brian Neiswander's script (2021). See his description:
%
% I’ve found that auto-scaling can be unwieldy, especially for large monitors. 
% For me, it usually more of an annoyance than a helpful action. 
% Instead, I would manually size my models’ width and height. 
% Then, I would decrease my resolution on my laptop screen 
% (as primary monitor) to 1280x960 and run my resave script that opens 
% each model, moves the window at a specific point (e.g., 20px from 
% top edge, 20px from left edge) while keeping the same width and height, 
% moves the scopes in a similar way, and then resaves the models. T
% his way, I knew the model and scopes would always nicely onto a lower-res
% or higher-res screen.  (And trainers wouldn’t complain about models being 
% off the screen on some projectors.)
% 
% Edited by Brian Hong 12/8/2021
%
    
    
    % Check for the recursive flag
    if ~nargin
	    flags = 0;
    end
    
    % Warn user before doing a bdclose all
    fprintf('This script will close all open models without saving.\n');
    code1 = randi([100,999]);
    if str2double(input(sprintf('Enter %d to continue: ',code1),'s'))==code1
        bdclose all;
    else
        disp('Cancelled');
        return
    end
    
    % Get the directory
    selpath = uigetdir();
    
    if ~flags
        
	    models = dir(selpath + "\*.slx");
    
	    % Add the folder to the name field
	    for ai = 1:length(models)
		    models(ai).name = fullfile(models(ai).folder,models(ai).name);
	    end
    elseif isequal(flags,'-r')
	    models = dir(selpath + "\**\*.slx");

	    % Add the folder to the name field
        for ai = 1:length(models)
            models(ai).name = fullfile(models(ai).folder,models(ai).name);
        end
    else
	    fprintf('Unknonw argument.');
	    return;
    end
    
    % Confirm to start the resave
    disp({models.name}');
    code2 = randi([100,999]);
    if str2double(input(sprintf('Enter %d to resave %d models: ',code2,length(models)),'s'))==code2
        % Set the cache folders to a tempdir
        cfolder = tempname;
        fprintf('Setting cache and code gen folders to %s...',cfolder);
        cfolder1_orig = Simulink.fileGenControl('get','CacheFolder');
        cfolder2_orig = Simulink.fileGenControl('get','CodeGenFolder');
        mkdir(cfolder);
        Simulink.fileGenControl('set','CacheFolder',cfolder);
        Simulink.fileGenControl('set','CodeGenFolder',cfolder);
    
        % Resave the models
	    resavemodels(models,selpath);
    else
	    disp('Cancelled');
        return
    end
    
    % Restore the original code gen folders
    fprintf('Resetting cache and code gen folders...');
    Simulink.fileGenControl('set','CacheFolder',cfolder1_orig);
    Simulink.fileGenControl('set','CodeGenFolder',cfolder2_orig);
    fprintf('done\n');

function resavemodels(slxFiles,selpath)
    
    %get the file names
    slxFiles = {slxFiles.name};
    
    %loop over all files
    N = length(slxFiles);
    for ai = 1:N
        %update prompt
        fprintf('----------------------------------------------------------------------------------\n');
        fprintf('Saving model %03i of %03i: %-70s\n',ai,N,slxFiles{ai});
        
        % update model
        updateModel(slxFiles{ai})
    end
    
    %remove all old files
    oldFiles = dir(selpath + "\**\*.slx.r20*");
    oldFiles = string({oldFiles.folder}) + filesep + string({oldFiles.name});
    oldFiles = cellstr(oldFiles);
    if ~isempty(oldFiles)
        fprintf('Deleting %d old files...',length(oldFiles));
        cellfun(@delete,oldFiles)
        fprintf('OK\n');
    else
        disp('No old files found.');
    end
    
    %turn off the diary
    diary off;

% ----------------------------------------------------------------------
function updateModel(modfile)
    
    try
        % Load the model
        fprintf('-- Loading model\n');
        open_system(modfile);
        
        % Get next model name
        [~,thisModel] = fileparts(modfile);
            
        % Update the model window position
        updateModelPosition(thisModel);
        
        % Update scope position
        setScopePosition(thisModel);
	    
	    % Update scope line width and color
	    setScopeLineWidthColor(thisModel,2);
	    
	    % Disable upgrade advisor warnings
        try
            add_param(thisModel,'DisableUpgradeWarningsForVersion','');
        catch
            fprintf('-- DisableUpgradeWarningsForVersion parameter already exists for model\n');
        end
    
        % Close and save the system
        fprintf('-- Saving and closing the model\n');
        close_system(thisModel,1);
        bdclose all;
    catch
        [emsg,eid] = lasterr;
        fprintf('ERROR \n%s\n%s\n\n\n',eid,emsg);
        keyboard
    end

% -------------------------------------------------------------------------
function updateModelPosition(modelname)
    
    % Check if it is a library, if so, unlock it first
    if bdIsLibrary(modelname)
        set_param(modelname,'Lock','off')
    end
    
    % Update the model position (measured from top-left of monitor)
    cpos = get_param(modelname,'Location');
%     
%     % Get current width and height
%     cwidth = cpos(3)-cpos(1); % calculate width
%     cheight = cpos(4)-cpos(2); % calculate height
    
    % Set new position, width, and height
    x0 = 25; % Adjusted BH
    y0 = 15;
    cwidth = 1200;
    cheight = 850;
    cpos(1) = x0; % left
    cpos(2) = y0; % top

    % Edited to produce a fixed size BH
    cpos(3) = x0 + cwidth;
    cpos(4) = y0 + cheight;
    set_param(modelname,'Location',cpos);
    
    % Adjust zoom
    pause(0.1);
    set_param(modelname,'ZoomFactor','FitSystem');
    pause(0.1);
    set_param(modelname,'ZoomFactor','100');
    pause(0.1);
    set_param(modelname,'ZoomFactor','FitSystem');
    pause(0.1);
    % BH: Want to land on the fit, not on the zoomfactor 100
%     set_param(modelname,'ZoomFactor','100');
%     pause(0.1);

% -------------------------------------------------------------------------
function setScopePosition(modelname)
    
    % Check if it is a library, if so, unlock it first
    if bdIsLibrary(modelname)
        set_param(modelname,'Lock','off')
    end
    
    % Get handles to all scopes
    allScopes = find_system(modelname,'Allblocks','on','BlockType','Scope');
    
    % Open all scopes
    for ai = 1:numel(allScopes)
	    open_system(allScopes{ai});
    
	    % Get the displays inside the scope (axes)
	    scopeSpec = get_param(allScopes{ai}, 'ScopeSpecificationObject');
        if ai<=5
            scopeSpec.setPosition([850,350-60*(ai-1),400,248])
        elseif ai<=10
            scopeSpec.setPosition([850+50,350-60*(ai-6),400,248])
        elseif ai<=15
            scopeSpec.setPosition([850+100,350-60*(ai-11),400,248])
        end
        
        % Close all scopes
        close_system(allScopes)
    end


% -------------------------------------------------------------------------
function setScopeLineWidthColor(modelname, linewidth)
    
    % Check if it is a library, if so, unlock it first
    if bdIsLibrary(modelname)
        set_param(modelname,'Lock','off')
    end
    
    % Get handles to all scopes
    allScopes = find_system(modelname,'Allblocks','on','BlockType','Scope');
    
    % Set the color order (default)
    colors(1,:) = [1.0000    1.0000    0.0667];
    colors(2,:) = [0.0745    0.6235    1.0000];
    colors(3,:) = [1.0000    0.4118    0.1608];
    colors(4,:) = [0.3922    0.8314    0.0745];
    colors(5,:) = [0.7176    0.2745    1.0000];
    colors(6,:) = [0.0588    1.0000    1.0000];
    colors(7,:) = [1.0000    0.0745    0.6510];
    
    % Open all scopes
    for ai = 1:numel(allScopes)
	    open_system(allScopes{ai});
    end
    
    % Try to simulate the model
    try 
	    sim(modelname,0);
	    fprintf('   -- Simulate for 0 seconds successful\n');
	    pause(0.5);
    catch
	    fprintf('   -- Simulate for 0 seconds FAILED\n');
    end
    
    % Iterate over each scope
    for ai = 1:numel(allScopes)
	    % Get the displays inside the scope (axes)
	    scopeSpec = get_param(allScopes{ai}, 'ScopeSpecificationObject');
	    displays = scopeSpec.getUnifiedScope.Visual.Displays;
	    
	    % Iterate over the displays
	    for bi = 1:numel(displays)
		    fprintf('   -- Configuring display %d\n',bi);
		    
		    % Turn on the legend
		    %fprintf('   -- Turning on the legend\n');
		    %displays{bi}.LegendVisibility = 'on';
		    
		    % Get the number of connected signals to the display
		    connectedSignals = numel(displays{bi}.ChannelNames);
		    
		    % Iterate over all connected signals
		    for ci = 1:connectedSignals
			    fprintf('   -- Setting line width for line %d\n',ci);
			    clear lineProperties;
			    
			    % Get the existing line style structure
			    lineProperties = displays{bi}.getLineProperties(ci);
			    
			    % Update the line width
			    lineProperties.LineWidth = linewidth;
			    
			    % Update the color to default order
			    lineProperties.Color = colors(ci,:);
			    
			    % Remove the other fields
			    try
				    lineProperties = rmfield(lineProperties,'DisplayName');
			    catch
				    disp('**** NOTICE COULD NOT FIND FIELD: DisplayName');
				    fid = fopen('NoDisplayNameFiles.txt','a');
				    fprintf(fid,'%s\n',modelname);
				    fclose(fid);
			    end
			    % Rewrite the structure
			    displays{bi}.setLineProperties(ci, lineProperties);
		    end
	    end
    end
    
    % Close all scopes
    close_system(allScopes)