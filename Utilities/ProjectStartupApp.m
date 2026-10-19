classdef ProjectStartupApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        StartUpAppUIFigure  matlab.ui.Figure
        VersionWarningPanel  matlab.ui.container.Panel
        VersionWarningGrid   matlab.ui.container.GridLayout
        VersionWarningTitle  matlab.ui.control.Label
        VersionWarningText   matlab.ui.control.Label
        VersionWarningButton matlab.ui.control.Button
        VersionContinueButton matlab.ui.control.Button
        FeedBackPanel       matlab.ui.container.Panel
        FeedBackGrid        matlab.ui.container.GridLayout
        ReviewTitle         matlab.ui.control.Label
        ReviewText          matlab.ui.control.Label
        OtherButton         matlab.ui.control.Button
        StudentButton       matlab.ui.control.Button
        FacultyButton       matlab.ui.control.Button
        Q1                  matlab.ui.control.Label
        WelcomePanel        matlab.ui.container.Panel
        WelcomeGrid         matlab.ui.container.GridLayout
        WelcomeTitle        matlab.ui.control.Label
        CoverImage          matlab.ui.control.Image
        ReviewUsButton      matlab.ui.control.Button
        READMEButton        matlab.ui.control.Button
        MainMenuButton      matlab.ui.control.Button
    end

    % Properties to be modified
    properties (Access = private)
        GitHubOrganization = "MathWorks-Teaching-Resources"; % Description
        GitHubRepository = "DC-Circuit-Analysis";
        ImagePath {mustBeFile} = fullfile("Images","image_11.png"); 
        LegacyMlxReleaseUrl = "https://github.com/MathWorks-Teaching-Resources/DC-Circuit-Analysis/releases/tag/mlx";
    end

    properties (Access = private)
        InitPosition;
        ProjectName;
    end

    methods (Access = private, Static)

        function tf = isMatlabOlderThanR2025a()
            release = string(version("-release"));
            token = regexp(release, "^(\d{4})([ab])$", "tokens", "once");
            if isempty(token)
                tf = isMATLABReleaseOlderThan("R2025a");
            else
                year = str2double(token{1});
                half = token{2};
                tf = year < 2025 || (year == 2025 && half < "a");
            end
        end

        function saveSettings(isReviewed,numLoad)
            try
                save(fullfile("Utilities","ProjectSettings.mat"),"isReviewed","numLoad");
            catch
            end
        end

    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            % Copy title and set cover image
            app.ProjectName = currentProject().Name;
            app.WelcomeTitle.Text = "Welcome to " + app.ProjectName; 
            app.ReviewTitle.Text = app.WelcomeTitle.Text;
            app.CoverImage.ImageSource = app.ImagePath;

            % Switch tab to review if has not been reviewed yet
            if isfile(fullfile("Utilities","ProjectSettings.mat"))
                load(fullfile("Utilities","ProjectSettings.mat"),"isReviewed","numLoad");
                numLoad = numLoad + 1; % Increment counter
            else
                isReviewed = false;
                numLoad = 1; % Initialize counter
            end

            % Select tab to display
            if ProjectStartupApp.isMatlabOlderThanR2025a()
                app.VersionWarningGrid.Parent = app.StartUpAppUIFigure;
            elseif ~isReviewed && numLoad > 2
                isReviewed = true;
                app.FeedBackGrid.Parent = app.StartUpAppUIFigure; 
            else
                app.WelcomeGrid.Parent = app.StartUpAppUIFigure;
            end
            app.InitPosition = app.StartUpAppUIFigure.Position;

            % Save new settings
            app.saveSettings(isReviewed,numLoad)
            
        end

        % Close request function: StartUpAppUIFigure
        function StartUpAppUIFigureCloseRequest(app, event)
            if event.Source == app.VersionWarningButton
                web(app.LegacyMlxReleaseUrl, "-browser")
                return
            elseif event.Source == app.VersionContinueButton
                app.VersionWarningGrid.Parent = app.VersionWarningPanel;
                app.WelcomeGrid.Parent = app.StartUpAppUIFigure;
                return
            elseif event.Source == app.READMEButton
                open README.m
            elseif event.Source == app.MainMenuButton
                open MainMenu.m
            elseif event.Source == app.FacultyButton
                open MainMenu.m            
            elseif event.Source == app.StudentButton
                open MainMenu.m
            elseif event.Source == app.OtherButton
                open MainMenu.m
            else
                disp("Thank you for your time.")
            end
            delete(app)
        end

        % Button pushed function: MainMenuButton
        function MainMenuButtonPushed(app, event)
            StartUpAppUIFigureCloseRequest(app,event)
        end

        % Button pushed function: FacultyButton
        function FacultyButtonPushed(app, event)
            % Open Faculty Form
            import matlab.net.*
            % Create the URI object with the base URL
            uri = URI('https://forms.office.com/Pages/ResponsePage.aspx','literal');
            % Set the Query property with an array of QueryParameter objects
            uri.Query = [
                QueryParameter('id', 'ETrdmUhDaESb3eUHKx3B5mlcO9AKxC5AgMAKBg6OKuBUNTVXVlBTS0lOU0hPRExYMldGWldVQUhIRC4u')
                QueryParameter('r2017080ed20546d1a2db18fe36421929', app.ProjectName)
                ];
            web(strrep(uri.EncodedURI,"+","%20"))
            StartUpAppUIFigureCloseRequest(app,event)
        end

        % Button pushed function: StudentButton
        function StudentButtonPushed(app, event)
            % Open Student Form
            import matlab.net.*
            % Create the URI object with the base URL
            uri = URI('https://forms.office.com/Pages/ResponsePage.aspx','literal');
            % Set the Query property with an array of QueryParameter objects
            uri.Query = [
                QueryParameter('id', 'ETrdmUhDaESb3eUHKx3B5mlcO9AKxC5AgMAKBg6OKuBUNlNBOVRZSDZHT1VTMzA4MjdHSUdVR0o3Vy4u')
                QueryParameter('r362e367caa234debbf4f65a58a0338e6', app.ProjectName)
                ];
            web(strrep(uri.EncodedURI,"+","%20"))
            StartUpAppUIFigureCloseRequest(app,event)
        end

        % Button pushed function: OtherButton
        function OtherButtonPushed(app, event)
            % Open Student Form
            import matlab.net.*
            % Create the URI object with the base URL
            uri = URI('https://forms.office.com/Pages/ResponsePage.aspx','literal');
            % Set the Query property with an array of QueryParameter objects
            uri.Query = [
                QueryParameter('id', 'ETrdmUhDaESb3eUHKx3B5mlcO9AKxC5AgMAKBg6OKuBUNlNBOVRZSDZHT1VTMzA4MjdHSUdVR0o3Vy4u')
                QueryParameter('r362e367caa234debbf4f65a58a0338e6', app.ProjectName)
                ];
            web(strrep(uri.EncodedURI,"+","%20"))
            StartUpAppUIFigureCloseRequest(app,event)
        end

        % Button pushed function: ReviewUsButton
        function ReviewUsButtonPushed(app, ~)
            app.WelcomeGrid.Parent = app.WelcomePanel;
            app.FeedBackGrid.Parent = app.StartUpAppUIFigure;
        end

        % Button pushed function: READMEButton
        function READMEButtonPushed(app, event)
            StartUpAppUIFigureCloseRequest(app,event)
        end

        % Button pushed function: VersionWarningButton
        function VersionWarningButtonPushed(app, event)
            StartUpAppUIFigureCloseRequest(app,event)
        end

        % Button pushed function: VersionContinueButton
        function VersionContinueButtonPushed(app, event)
            StartUpAppUIFigureCloseRequest(app,event)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create StartUpAppUIFigure and hide until all components are created
            app.StartUpAppUIFigure = uifigure('Visible', 'off');
            app.StartUpAppUIFigure.AutoResizeChildren = 'off';
            app.StartUpAppUIFigure.Position = [100 100 276 430];
            app.StartUpAppUIFigure.Name = 'StartUp App';
            app.StartUpAppUIFigure.CloseRequestFcn = createCallbackFcn(app, @StartUpAppUIFigureCloseRequest, true);

            % Create VersionWarningPanel
            app.VersionWarningPanel = uipanel(app.StartUpAppUIFigure);
            app.VersionWarningPanel.AutoResizeChildren = 'off';
            app.VersionWarningPanel.Position = [-811 33 244 410];

            % Create VersionWarningGrid
            app.VersionWarningGrid = uigridlayout(app.VersionWarningPanel);
            app.VersionWarningGrid.ColumnWidth = {'1x', '8x', '1x'};
            app.VersionWarningGrid.RowHeight = {'2x', '5x', '1x', '1x'};

            % Create VersionWarningTitle
            app.VersionWarningTitle = uilabel(app.VersionWarningGrid);
            app.VersionWarningTitle.HorizontalAlignment = 'center';
            app.VersionWarningTitle.VerticalAlignment = 'top';
            app.VersionWarningTitle.WordWrap = 'on';
            app.VersionWarningTitle.FontSize = 22;
            app.VersionWarningTitle.FontWeight = 'bold';
            app.VersionWarningTitle.Layout.Row = 1;
            app.VersionWarningTitle.Layout.Column = [1 3];
            app.VersionWarningTitle.Text = 'Using MATLAB R2024b or older?';

            % Create VersionWarningText
            app.VersionWarningText = uilabel(app.VersionWarningGrid);
            app.VersionWarningText.HorizontalAlignment = 'center';
            app.VersionWarningText.WordWrap = 'on';
            app.VersionWarningText.FontSize = 14;
            app.VersionWarningText.Layout.Row = 2;
            app.VersionWarningText.Layout.Column = [1 3];
            app.VersionWarningText.Text = 'For a better viewing experience in MATLAB R2024b or older, download this courseware from the legacy GitHub release.';

            % Create VersionWarningButton
            app.VersionWarningButton = uibutton(app.VersionWarningGrid, 'push');
            app.VersionWarningButton.ButtonPushedFcn = createCallbackFcn(app, @VersionWarningButtonPushed, true);
            app.VersionWarningButton.FontSize = 16;
            app.VersionWarningButton.Layout.Row = 3;
            app.VersionWarningButton.Layout.Column = 2;
            app.VersionWarningButton.Text = 'Open Legacy Release';

            % Create VersionContinueButton
            app.VersionContinueButton = uibutton(app.VersionWarningGrid, 'push');
            app.VersionContinueButton.ButtonPushedFcn = createCallbackFcn(app, @VersionContinueButtonPushed, true);
            app.VersionContinueButton.FontSize = 16;
            app.VersionContinueButton.Layout.Row = 4;
            app.VersionContinueButton.Layout.Column = 2;
            app.VersionContinueButton.Text = 'Continue';

            % Create WelcomePanel
            app.WelcomePanel = uipanel(app.StartUpAppUIFigure);
            app.WelcomePanel.AutoResizeChildren = 'off';
            app.WelcomePanel.Position = [-551 33 244 410];

            % Create WelcomeGrid
            app.WelcomeGrid = uigridlayout(app.WelcomePanel);
            app.WelcomeGrid.ColumnWidth = {'1x', '8x', '1x'};
            app.WelcomeGrid.RowHeight = {'2x', '5x', '1x', '1x', '1x'};

            % Create MainMenuButton
            app.MainMenuButton = uibutton(app.WelcomeGrid, 'push');
            app.MainMenuButton.ButtonPushedFcn = createCallbackFcn(app, @MainMenuButtonPushed, true);
            app.MainMenuButton.FontSize = 18;
            app.MainMenuButton.Layout.Row = 3;
            app.MainMenuButton.Layout.Column = 2;
            app.MainMenuButton.Text = 'Main Menu';

            % Create READMEButton
            app.READMEButton = uibutton(app.WelcomeGrid, 'push');
            app.READMEButton.ButtonPushedFcn = createCallbackFcn(app, @READMEButtonPushed, true);
            app.READMEButton.FontSize = 18;
            app.READMEButton.Layout.Row = 4;
            app.READMEButton.Layout.Column = 2;
            app.READMEButton.Text = 'README';

            % Create ReviewUsButton
            app.ReviewUsButton = uibutton(app.WelcomeGrid, 'push');
            app.ReviewUsButton.ButtonPushedFcn = createCallbackFcn(app, @ReviewUsButtonPushed, true);
            app.ReviewUsButton.FontSize = 18;
            app.ReviewUsButton.Layout.Row = 5;
            app.ReviewUsButton.Layout.Column = 2;
            app.ReviewUsButton.Text = 'Review Us';

            % Create CoverImage
            app.CoverImage = uiimage(app.WelcomeGrid);
            app.CoverImage.Layout.Row = 2;
            app.CoverImage.Layout.Column = [1 3];
            app.CoverImage.ImageSource = app.ImagePath;

            % Create WelcomeTitle
            app.WelcomeTitle = uilabel(app.WelcomeGrid);
            app.WelcomeTitle.HorizontalAlignment = 'center';
            app.WelcomeTitle.VerticalAlignment = 'top';
            app.WelcomeTitle.WordWrap = 'on';
            app.WelcomeTitle.FontSize = 24;
            app.WelcomeTitle.FontWeight = 'bold';
            app.WelcomeTitle.Layout.Row = 1;
            app.WelcomeTitle.Layout.Column = [1 3];
            app.WelcomeTitle.Text = '';

            % Create FeedBackPanel
            app.FeedBackPanel = uipanel(app.StartUpAppUIFigure);
            app.FeedBackPanel.AutoResizeChildren = 'off';
            app.FeedBackPanel.Position = [-291 33 236 409];

            % Create FeedBackGrid
            app.FeedBackGrid = uigridlayout(app.FeedBackPanel);
            app.FeedBackGrid.ColumnWidth = {'1x', '8x', '1x'};
            app.FeedBackGrid.RowHeight = {'2x', '3x', '2x', '1x', '1x', '1x'};

            % Create Q1
            app.Q1 = uilabel(app.FeedBackGrid);
            app.Q1.HorizontalAlignment = 'center';
            app.Q1.WordWrap = 'on';
            app.Q1.FontSize = 18;
            app.Q1.FontWeight = 'bold';
            app.Q1.Layout.Row = 3;
            app.Q1.Layout.Column = [1 3];
            app.Q1.Text = 'What describes you best?';

            % Create FacultyButton
            app.FacultyButton = uibutton(app.FeedBackGrid, 'push');
            app.FacultyButton.ButtonPushedFcn = createCallbackFcn(app, @FacultyButtonPushed, true);
            app.FacultyButton.FontSize = 18;
            app.FacultyButton.Layout.Row = 4;
            app.FacultyButton.Layout.Column = 2;
            app.FacultyButton.Text = 'Faculty';

            % Create StudentButton
            app.StudentButton = uibutton(app.FeedBackGrid, 'push');
            app.StudentButton.ButtonPushedFcn = createCallbackFcn(app, @StudentButtonPushed, true);
            app.StudentButton.FontSize = 18;
            app.StudentButton.Layout.Row = 5;
            app.StudentButton.Layout.Column = 2;
            app.StudentButton.Text = 'Student';

            % Create OtherButton
            app.OtherButton = uibutton(app.FeedBackGrid, 'push');
            app.OtherButton.ButtonPushedFcn = createCallbackFcn(app, @OtherButtonPushed, true);
            app.OtherButton.FontSize = 18;
            app.OtherButton.Layout.Row = 6;
            app.OtherButton.Layout.Column = 2;
            app.OtherButton.Text = 'Other';

            % Create ReviewText
            app.ReviewText = uilabel(app.FeedBackGrid);
            app.ReviewText.HorizontalAlignment = 'center';
            app.ReviewText.WordWrap = 'on';
            app.ReviewText.FontSize = 14;
            app.ReviewText.Layout.Row = 2;
            app.ReviewText.Layout.Column = [1 3];
            app.ReviewText.Text = 'Please help us improve your experience by answering a few questions.';

            % Create ReviewTitle
            app.ReviewTitle = uilabel(app.FeedBackGrid);
            app.ReviewTitle.HorizontalAlignment = 'center';
            app.ReviewTitle.VerticalAlignment = 'top';
            app.ReviewTitle.WordWrap = 'on';
            app.ReviewTitle.FontSize = 24;
            app.ReviewTitle.FontWeight = 'bold';
            app.ReviewTitle.Layout.Row = 1;
            app.ReviewTitle.Layout.Column = [1 3];
            app.ReviewTitle.Text = '';

            % Show the figure after all components are created
            app.StartUpAppUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ProjectStartupApp

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.StartUpAppUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.StartUpAppUIFigure)
        end
    end
end
