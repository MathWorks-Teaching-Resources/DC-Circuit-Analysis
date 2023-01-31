% Resize the model window
set(0,"Units","pixels")
sSize = get(0,"screensize");
space =  sSize(4)*0.03;
set_param(gcs,'location',  [1,1,round(sSize(3)/2),sSize(4)-space]);
% Reset the zoom
set_param(gcs, 'ZoomFactor','FitSystem')
% Resize the windows
space = sSize(4)*0.032;
SAsize = ['[',num2str(round([(sSize(3)/2)+1,...
                    space,(sSize(3)/2)-1,sSize(4)/2-space*1.25])),']'];
DSOsize = ['[',num2str(round([(sSize(3)/2)+1,...
                  space/2+sSize(4)/2,(sSize(3)/2)-1,sSize(4)/2-1.25*space])),']'];
