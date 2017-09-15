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

% Last Modified by GUIDE v2.5 15-Sep-2017 16:20:55

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

% set(findobj(gcf, 'type', 'axes'), 'Visible', 'off');
set(findobj(gcf, 'type', 'axes'), 'xtick', [], 'ytick', []);


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

% Read image from user's computer
[filename, pathname] = uigetfile('*.jpg', 'Select an image');
if ~isequal(filename, 0)
  image = imread(strcat(pathname, filename));

  % Store image in a property on handles to share it across functions
  handles.image = image;
  guidata(hObject, handles);

  % Show image in axes
  axes(handles.imageAxes);
  imshow(image);
end

% --- Executes on button press in thresholdImageButton.
function thresholdImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to thresholdImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Retrieve image from handles
try
  image = rgb2gray(handles.image);

  % Threshold image
  otsu_level = graythresh(image);
  thresholded_image = threshold_image(image, otsu_level);

  % Show image in axes
  axes(handles.thresholdImageAxes);
  imshow(thresholded_image);
catch ME
  if(strcmp(ME.identifier, 'MATLAB:nonExistentField'))
    'File not selected'
  end
end

% --- Executes on slider movement.
function thresholdSlider_Callback(hObject, eventdata, handles)
% hObject    handle to thresholdSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

try
  image = handles.image2;
  threshold_value = round(get(handles.thresholdSlider, 'Value'));
  thresholded_image = threshold_image(image, threshold_value);

  axes(handles.gradualThresholdImageAxes);
  imshow(thresholded_image);
catch ME
  if(strcmp(ME.identifier, 'MATLAB:nonExistentField'))
    'File not selected'
  end
end



% --- Executes during object creation, after setting all properties.
function thresholdSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thresholdSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in loadImageButton2.
function loadImageButton2_Callback(hObject, eventdata, handles)
% hObject    handle to loadImageButton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile('*.jpg', 'Select an image');
if ~isequal(filename, 0)
  image = imread(strcat(pathname, filename));
  gray_image = rgb2gray(image);

  otsu_level = graythresh(gray_image);
  thresholded_image = threshold_image(gray_image, otsu_level);

  set(handles.thresholdSlider, 'Value', round(otsu_level * 255));

  handles.image2 = gray_image;
  guidata(hObject, handles);

  axes(handles.imageAxes2);
  imshow(image);

  axes(handles.gradualThresholdImageAxes)
  imshow(thresholded_image);
end
