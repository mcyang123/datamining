function varargout = GUI_traffic_data_mining(varargin)
% GUI_TRAFFIC_DATA_MINING MATLAB code for GUI_traffic_data_mining.fig
%      GUI_TRAFFIC_DATA_MINING, by itself, creates a new GUI_TRAFFIC_DATA_MINING or raises the existing
%      singleton*.
%
%      H = GUI_TRAFFIC_DATA_MINING returns the handle to a new GUI_TRAFFIC_DATA_MINING or the handle to
%      the existing singleton*.
%
%      GUI_TRAFFIC_DATA_MINING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TRAFFIC_DATA_MINING.M with the given input arguments.
%
%      GUI_TRAFFIC_DATA_MINING('Property','Value',...) creates a new GUI_TRAFFIC_DATA_MINING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_traffic_data_mining_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_traffic_data_mining_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_traffic_data_mining

% Last Modified by GUIDE v2.5 14-Nov-2015 15:22:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_traffic_data_mining_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_traffic_data_mining_OutputFcn, ...
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


% --- Executes just before GUI_traffic_data_mining is made visible.
function GUI_traffic_data_mining_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_traffic_data_mining (see VARARGIN)
handles.line = get(handles.line_name,'Vaule');
handles.p_method = get(handles.plot_method,'Vaule');
handles.D  = get(handles.Date,'Vaule');
handles.W  = get(handles.week,'Vaule');
handles.T_method  = get(handles.train_method,'Vaule');

% Choose default command line output for GUI_traffic_data_mining
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_traffic_data_mining wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_traffic_data_mining_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in line_name.
function line_name_Callback(hObject, eventdata, handles)
% hObject    handle to line_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns line_name contents as cell array
%        contents{get(hObject,'Value')} returns selected item from line_name


% --- Executes during object creation, after setting all properties.
function line_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to line_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in plot_methed.
function plot_methed_Callback(hObject, eventdata, handles)
% hObject    handle to plot_methed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plot_methed contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plot_methed


% --- Executes during object creation, after setting all properties.
function plot_methed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot_methed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Date.
function Date_Callback(hObject, eventdata, handles)
% hObject    handle to Date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Date contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Date


% --- Executes during object creation, after setting all properties.
function Date_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Hour.
function Hour_Callback(hObject, eventdata, handles)
% hObject    handle to Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Hour


% --- Executes during object creation, after setting all properties.
function Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in week.
function week_Callback(hObject, eventdata, handles)
% hObject    handle to week (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns week contents as cell array
%        contents{get(hObject,'Value')} returns selected item from week


% --- Executes during object creation, after setting all properties.
function week_CreateFcn(hObject, eventdata, handles)
% hObject    handle to week (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in train_method.
function train_method_Callback(hObject, eventdata, handles)
% hObject    handle to train_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns train_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from train_method


% --- Executes during object creation, after setting all properties.
function train_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to train_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
