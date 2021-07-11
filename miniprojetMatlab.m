function varargout = miniprojetMatlab(varargin)
% MINIPROJETMATLAB M-file for miniprojetMatlab.fig
%      MINIPROJETMATLAB, by itself, creates a new MINIPROJETMATLAB or raises the existing
%      singleton*.
%
%      H = MINIPROJETMATLAB returns the handle to a new MINIPROJETMATLAB or the handle to
%      the existing singleton*.
%
%      MINIPROJETMATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINIPROJETMATLAB.M with the given input arguments.
%
%      MINIPROJETMATLAB('Property','Value',...) creates a new MINIPROJETMATLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before miniprojetMatlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to miniprojetMatlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help miniprojetMatlab

% Last Modified by GUIDE v2.5 11-Jun-2021 21:58:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @miniprojetMatlab_OpeningFcn, ...
                   'gui_OutputFcn',  @miniprojetMatlab_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before miniprojetMatlab is made visible.
function miniprojetMatlab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to miniprojetMatlab (see VARARGIN)

% Choose default command line output for miniprojetMatlab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes miniprojetMatlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = miniprojetMatlab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

[signal,Fs]=wavread('bonjour.wav');     
sound(signal,Fs);

% Lecture d'une parole %%

axes(handles.axes1);
plot(signal);
title ('Lecture du parole ');

% Le spectrogramme du parole %

axes(handles.axes2);
s =spectrogram(signal);   
spectrogram (signal,'yaxis')
plot  (s);
title ('Le spectrogramme du parole ');

% La fonction de corrélation

axes(handles.axes3);
y = xcorr (signal,Fs) 
plot (y)
title ('Analyse par la fonction de corrélation ');

% La transformée du Fourrier

axes(handles.axes4);
fx = fft(signal)
plot (fx)
title ('Analyse de parole par une transformée du fourrier');


% La fonction cepstre

axes(handles.axes5);
c = cceps(signal);
plot(c)
title('Analyse du parole par la fonction cepstre')


% Filtre du Wiener

axes(handles.axes6);
win_size = 7;
y = wiener2(signal,[win_size,win_size]);
plot (y)
title ('Débruitage de la parole ');




% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

cla(handles.axes1,'reset'); 
cla(handles.axes2,'reset'); 
cla(handles.axes3,'reset'); 
cla(handles.axes4,'reset'); 
cla(handles.axes5,'reset'); 
cla(handles.axes6,'reset'); 
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


