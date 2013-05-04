function varargout = ComputerVisionProj(varargin)
% COMPUTERVISIONPROJ MATLAB code for ComputerVisionProj.fig
%      COMPUTERVISIONPROJ, by itself, creates a new COMPUTERVISIONPROJ or raises the existing
%      singleton*.
%
%      H = COMPUTERVISIONPROJ returns the handle to a new COMPUTERVISIONPROJ or the handle to
%      the existing singleton*.
%
%      COMPUTERVISIONPROJ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPUTERVISIONPROJ.M with the given input arguments.
%
%      COMPUTERVISIONPROJ('Property','Value',...) creates a new COMPUTERVISIONPROJ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ComputerVisionProj_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ComputerVisionProj_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ComputerVisionProj

% Last Modified by GUIDE v2.5 29-Apr-2013 22:27:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ComputerVisionProj_OpeningFcn, ...
                   'gui_OutputFcn',  @ComputerVisionProj_OutputFcn, ...
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


% --- Executes just before ComputerVisionProj is made visible.
function ComputerVisionProj_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ComputerVisionProj (see VARARGIN)

% Choose default command line output for ComputerVisionProj
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ComputerVisionProj wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ComputerVisionProj_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function openFile_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to openFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Find Interactivly the path to the selected picture
[filename, pathname] = uigetfile( ...
{'*.jpg*',  'Jpeg File (*.jpg*)'}, ...
   'Pick a file');

%if the user chose a file to work with 
if (filename ~= 0)
    %load the image to workspace variable
    assignin('base', 'importedImg', imread(strcat(pathname,filename),'jpg'));
end



