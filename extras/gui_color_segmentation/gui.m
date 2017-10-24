function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 23-Oct-2017 11:20:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Remove existent axis from axes
set(findobj(gcf, 'type', 'axes'), 'xtick', [], 'ytick', []);

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


vid = videoinput('winvideo', 1, 'YUY2_640x480');
vid.ReturnedColorspace = 'rgb';

handles.vid = vid;
handles.output = hObject;
guidata(hObject, handles);

axes(handles.videoAxes);
% hImage = image(zeros(640, 480, 3), 'Parent', handles.videoAxes);
hImage = image(zeros(320, 240, 3), 'Parent', handles.videoAxes);
setappdata(hImage,'UpdatePreviewWindowFcn',@rotate_video); 
preview(handles.vid, hImage);


% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% closePreview(handles.cam);
% delete(handles.cam);
% guidata(hObject, handles);

stoppreview(handles.vid);
delete(handles.vid);
clear handles.vid;

% cla(handles.videoAxes, 'reset');


% --- Executes on button press in snapshotButton.
function snapshotButton_Callback(hObject, eventdata, handles)
% hObject    handle to snapshotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
frame = flip(getsnapshot(handles.vid), 2);

handles.frame = frame;
guidata(hObject, handles);

axes(handles.snapshotAxes);
image(frame);


% --- Executes on button press in saveSnapshotButton.
function saveSnapshotButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveSnapshotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imwrite(handles.frame, 'image.jpg');
figure, imshow(handles.frame);


function rotate_video(obj, event, himage)
    rot_image = flip(event.Data, 2);
    set(himage, 'cdata', rot_image);
