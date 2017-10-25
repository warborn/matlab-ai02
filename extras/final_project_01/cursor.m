function varargout = cursor(varargin)
% CURSOR MATLAB code for cursor.fig
%      CURSOR, by itself, creates a new CURSOR or raises the existing
%      singleton*.
%
%      H = CURSOR returns the handle to a new CURSOR or the handle to
%      the existing singleton*.
%
%      CURSOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CURSOR.M with the given input arguments.
%
%      CURSOR('Property','Value',...) creates a new CURSOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cursor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cursor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cursor

% Last Modified by GUIDE v2.5 24-Oct-2017 20:46:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cursor_OpeningFcn, ...
                   'gui_OutputFcn',  @cursor_OutputFcn, ...
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


% --- Executes just before cursor is made visible.
function cursor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cursor (see VARARGIN)

% Choose default command line output for cursor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cursor wait for user response (see UIRESUME)
% uiwait(handles.figure);

% Custom Code

% Clear console
clc

% Import Java Robot class for mouse cursor manipulation
import java.awt.Robot;
mouse = Robot;
handles.mouse = mouse;

% Get laptop's screen width and height
screenSize = get(0, 'screensize');
handles.screenWidth = screenSize(3);
handles.screenHeight = screenSize(4);

% Set cursor default speed to two pixels per movement
handles.speed = get(handles.speedSlider, 'Value');

set(handles.speedText, 'String', string(handles.speed));

handles.currentPoint = struct;

% Save new handles properties
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = cursor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upButton.
function upButton_Callback(hObject, eventdata, handles)
% hObject    handle to upButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in downButton.
function downButton_Callback(hObject, eventdata, handles)
% hObject    handle to downButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rightButton.
function rightButton_Callback(hObject, eventdata, handles)
% hObject    handle to rightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in leftButton.
function leftButton_Callback(hObject, eventdata, handles)
% hObject    handle to leftButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on figure or any of its controls.
function figure_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% Get current pointer location
pointerLocation = get(0, 'PointerLocation');

% Store the X coordinate
handles.currentPoint.x = pointerLocation(1);
% Store the Y coordinate
handles.currentPoint.y = handles.screenHeight - pointerLocation(2);

% Extract a string with the name of the pressed arrow key
direction = regexprep(eventdata.Key, 'arrow$', '');

if strcmp(direction, 'up') || strcmp(direction, 'down') || strcmp(direction, 'right') || strcmp(direction, 'left')
  paintbutton(handles, direction, 'g');
  mousemove(handles.mouse, handles.currentPoint, direction, handles.speed);
end


% --- Executes on key release with focus on figure or any of its controls.
function figure_WindowKeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)

direction = regexprep(eventdata.Key, 'arrow$', '');
paintbutton(handles, direction, [0.94, 0.94, 0.94]);


% --- Executes on slider movement.
function speedSlider_Callback(hObject, eventdata, handles)
% hObject    handle to speedSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% Change cursor default speed
handles.speed = get(handles.speedSlider, 'Value');
set(handles.speedText, 'String', string(handles.speed));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function speedSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speedSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
