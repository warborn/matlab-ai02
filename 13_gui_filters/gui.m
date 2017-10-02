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

% Last Modified by GUIDE v2.5 01-Oct-2017 17:18:20

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

set(findobj(gcf, 'type', 'axes'), 'xtick', [], 'ytick', []);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadImageButton.
function loadImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.jpg', 'Select an image');
if ~isequal(filename, 0)
  image = imread(strcat(pathname, filename));

  handles.image = rgb2gray(image);
  guidata(hObject, handles);

  axes(handles.imageAxes)
  imshow(image);
end


% --- Executes on button press in medianButton.
function medianButton_Callback(hObject, eventdata, handles)
% hObject    handle to medianButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filtered_image = medfilt2(handles.image);

axes(handles.imageAxes);
imshow(filtered_image);


% --- Executes on button press in maximumButton.
function maximumButton_Callback(hObject, eventdata, handles)
% hObject    handle to maximumButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filtered_image = ordfilt2(handles.image, 9, ones(3, 3));

axes(handles.imageAxes);
imshow(filtered_image);


% --- Executes on button press in minimumButton.
function minimumButton_Callback(hObject, eventdata, handles)
% hObject    handle to minimumButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filtered_image = ordfilt2(handles.image, 1, ones(3, 3));

axes(handles.imageAxes);
imshow(filtered_image);


% --- Executes on button press in gaussianButton.
function gaussianButton_Callback(hObject, eventdata, handles)
% hObject    handle to gaussianButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filtered_image = imgaussfilt(handles.image);

axes(handles.imageAxes);
imshow(filtered_image);

% --- Executes on button press in noiseButton.
function noiseButton_Callback(hObject, eventdata, handles)
% hObject    handle to noiseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = handles.image;
noise_image = imnoise(image, 'salt & pepper', 0.05);

handles.image = noise_image;
guidata(hObject, handles);

axes(handles.imageAxes);
imshow(noise_image);
