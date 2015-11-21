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

% Last Modified by GUIDE v2.5 21-Nov-2015 20:43:39

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
filename = dir('E:\mike\project\datamining\data\python2matlab\');       %获取路径下的文件名
fname = filename(3).name;                                                          %将文件名放到一个数组下
for i = 4:length(filename)
    temp = filename(i).name;
    fname = char(fname,temp);
end
handles.fname = fname;
set(handles.line_name,'String',fname);                                           %显示文件名以供选择
handles.ReadD = get(handles.line_name,'Value');  
%handles.p_method = get(handles.plot_method,'Vaule');
% handles.D  = get(handles.Date,'Vaule');
% handles.W  = get(handles.week,'Vaule');
handles.T_method  = get(handles.train_method,'Value');
handles.save_path  = get(handles.result_path,'String');
handles.score_line = get(handles.s_line,'Value');  
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
handles.ReadD = get(handles.line_name,'Value');
guidata(hObject, handles);
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
handles.T_method  = get(handles.train_method,'Vaule');
guidata(hObject, handles);
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


% --- Executes on button press in readdata.
function readdata_Callback(hObject, eventdata, handles)
% hObject    handle to readdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fname = handles.fname(handles.ReadD,:);             %获取要读取的文件路径
Fname2 = strcat('E:\mike\project\datamining\data\python2matlab\',Fname);
D = xlsread(Fname2);                                            %读取文件数据
data.Date = D(:,2);                                               %将数据拆分成结构类型
data.Hour = D(:,3);
data.week = D(:,4);
data.weather = D(:,5);
data.total = D(:,6);
index = find(data.Hour>21 | data.Hour<6 ) ;         %去掉21到6时的数据
data.Date(index) = [];
data.Hour(index) = [];
data.week(index) = [];
data.weather(index) = [];
data.total (index) = [];
data = add_tag(data,[906,907,908,928,1001,1002,1003,1004,1005,1006,1007,1008,1011]);
Fmat = strcat(Fname(1:(length(Fname)-4)),'mat');
save(Fmat,'data');



function result_path_Callback(hObject, eventdata, handles)
% hObject    handle to result_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.save_path  = get(handles.result_path,'String');
% Hints: get(hObject,'String') returns contents of result_path as text
%        str2double(get(hObject,'String')) returns contents of result_path as a double


% --- Executes during object creation, after setting all properties.
function result_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in result_output.
function result_output_Callback(hObject, eventdata, handles)
% hObject    handle to result_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 path = get(handles.result_path,'String');
if length(path) ==0
    path ='gd_predict.txt';
end
T_method = handles.T_method;
load('line_15.mat');
switch T_method
    case 1 
        F = @(x) train_function_single(x,2);
end
tra0 = train_function_all(data,0,F);
tra1 = train_function_all(data,1,F);
tra_15 = [tra0([3:end],:) ; tra1(1,:); tra1(1,:); tra1(1,:); tra1(2,:)];
clear data
load('line_10.mat');
switch T_method
    case 1 
        F = @(x) train_function_single(x,2);
end
tra0 = train_function_all(data,0,F);
tra1 = train_function_all(data,1,F);
tra_10 = [tra0([3:end],:) ; tra1(1,:); tra1(1,:); tra1(1,:); tra1(2,:)];
txt_output( tra_15,tra_10,path);



function SDate_Callback(hObject, eventdata, handles)
% hObject    handle to SDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SDate as text
%        str2double(get(hObject,'String')) returns contents of SDate as a double


% --- Executes during object creation, after setting all properties.
function SDate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.score_line
    case 1                  %line10
        load('line_10.mat');
    case 2
        load('line_15.mat');
end
load('daylist.mat');
sampleDate  = str2num(get(handles.SDate,'String'));
index = find(daylist == sampleDate);
seq = daylist(index:index+6);
real = separate(data,seq,3);
data_s = separate(data,seq,0);
F = @(x) train_function_single(x,2);
tra0 = train_function_all(data_s,0,F);
tra1 = train_function_all(data_s,1,F);
data_r = separate(data,seq,1);
data_r(1)
for i =1:7
    if data_r(i).tag ==0
        est(data_r.week,:)  = tra0(data_r(i).week,:);
    else
        if data_r(i).week == 6 | data_r(i).week == 7
            est(data_r(i).week,:)  = tra1(2,:);
        else 
            est(data_r(i).week,:)  = tra1(1,:);
        end
    end
end
score_c = score_count(real,est);
set(handles. score_out,'String',num2str(score_c));  
% --- Executes on selection change in s_line.
function s_line_Callback(hObject, eventdata, handles)
% hObject    handle to s_line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.score_line = get(handles.s_line,'Value');  
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns s_line contents as cell array
%        contents{get(hObject,'Value')} returns selected item from s_line


% --- Executes during object creation, after setting all properties.
function s_line_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
