function varargout = InterpolationGUI(varargin)
% INTERPOLATIONGUI MATLAB code for InterpolationGUI.fig
%      INTERPOLATIONGUI, by itself, creates a new INTERPOLATIONGUI or raises the existing
%      singleton*.
%
%      H = INTERPOLATIONGUI returns the handle to a new INTERPOLATIONGUI or the handle to
%      the existing singleton*.
%
%      INTERPOLATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERPOLATIONGUI.M with the given input arguments.
%
%      INTERPOLATIONGUI('Property','Value',...) creates a new INTERPOLATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterpolationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterpolationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterpolationGUI

% Last Modified by GUIDE v2.5 10-May-2018 18:44:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @InterpolationGUI_OpeningFcn, ...
    'gui_OutputFcn',  @InterpolationGUI_OutputFcn, ...
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


% --- Executes just before InterpolationGUI is made visible.
function InterpolationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterpolationGUI (see VARARGIN)

% Choose default command line output for InterpolationGUI
handles.output = hObject;
% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('example.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterpolationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterpolationGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pointX_Callback(hObject, eventdata, handles)
% hObject    handle to pointX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointX as text
%        str2double(get(hObject,'String')) returns contents of pointX as a double


% --- Executes during object creation, after setting all properties.
function pointX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pointY_Callback(hObject, eventdata, handles)
% hObject    handle to pointY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointY as text
%        str2double(get(hObject,'String')) returns contents of pointY as a double


% --- Executes during object creation, after setting all properties.
function pointY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function polyOrder_Callback(hObject, eventdata, handles)
% hObject    handle to polyOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of polyOrder as text
%        str2double(get(hObject,'String')) returns contents of polyOrder as a double


% --- Executes during object creation, after setting all properties.
function polyOrder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polyOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in getFnBtn.
function getFnBtn_Callback(hObject, eventdata, handles)
% hObject    handle to getFnBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
polyorder=str2double(get(handles.polyOrder,'String'));
currentTable = get(handles.pointsTable,'Data');
[height, width]=size(currentTable);
disp('table');
disp(height)
disp(width)
disp(polyorder)
if(polyorder+1==height)
    xPoints = currentTable(2:height , 1:1);
    xPoints = xPoints.';
    yPoints = currentTable(2:height , 2:2);
    yPoints = yPoints.';
    contents = get(handles.methodMenu,'String');
    value = contents{get(handles.methodMenu,'Value')};
    set(handles.substituteBtn,'Visible', 'on');
    set(handles.subsPoint,'Visible', 'on');
    tic;
    switch value
        case 'Lagrange'
            func= Lagrange(xPoints, yPoints);
            set(handles.fnLbl,'String', func);
        case 'Newton'
            func = newton_interpolation(xPoints, yPoints);
            set(handles.fnLbl,'String', func);
    end
    time = toc;
     handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
            legend(handles.axes1,'f(x)','points' ,'L');
    
end
inpMthdContent = get(handles.inputMethod,'String');
popChoice = inpMthdContent{get(handles.inputMethod,'Value')};
popChoice
if(strcmp(popChoice,'Read from file'))
    disp('reading from file');
    array = Read_File(get(handles.fileSrc, 'String'));
    numOfPoints = array(2);
    xPoints = strsplit(array(3),',');
    xPoints = str2double(xPoints);
    yPoints = strsplit(array(4),',');
    yPoints = str2double(yPoints);
    if ( str2double(numOfPoints)~=length(xPoints))
        msgbox('wrong Number of Points');
    else
    tic;
    switch array(1)
        case '1'
            func= Lagrange(xPoints, yPoints);
        case '2'
            func = newton_interpolation(xPoints, yPoints);
    end
    time = toc;
    set(handles.fnLbl,'String', func);
    array(5)
    subsPoints = str2double(strsplit(array(5),','));
    results = getValues(func,subsPoints );
    set(handles.xpoints,'String',subsPoints);
    set(handles.resultLbl,'String',results);
    set(handles.exeTime,'String',time);
    end
    handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
          %  legend(handles.axes1,'f(x)','points');
end

  


% --- Executes on button press in substituteBtn.
function substituteBtn_Callback(hObject, eventdata, handles)
% hObject    handle to substituteBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
func = get(handles.fnLbl,'String');
xPoint = str2double(get(handles.subsPoint,'String'));
result = double(subs(func,xPoint));
set(handles.resultLbl,'String',result);


% --- Executes on button press in addPtBtn.
function addPtBtn_Callback(hObject, eventdata, handles)
% hObject    handle to addPtBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

xPoint = str2double(get(handles.pointX, 'String'));
yPoint = str2double(get(handles.pointY, 'String'));

currentTable = get(handles.pointsTable,'Data');
newPoint = [xPoint yPoint];
currentTable = [currentTable; newPoint];
set(handles.pointsTable,'Data' , currentTable);

% --- Executes on selection change in methodMenu.
function methodMenu_Callback(hObject, eventdata, handles)
cla reset;
%set(handles.pointsTable('Visible', 1));
currentTable(1,1) = 0;
currentTable(1,2) = 0;
set(handles.subsPoint,'Visible','off');
set(handles.substituteBtn,'Visible','off');
set(handles.pointsTable,'Data', currentTable);

% hObject    handle to methodMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns methodMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from methodMenu


% --- Executes during object creation, after setting all properties.
function methodMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to methodMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function subsPoint_Callback(hObject, eventdata, handles)
% hObject    handle to subsPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subsPoint as text
%        str2double(get(hObject,'String')) returns contents of subsPoint as a double


% --- Executes during object creation, after setting all properties.
function subsPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subsPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in inputMethod.
function inputMethod_Callback(hObject, eventdata, handles)
% hObject    handle to inputMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns inputMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inputMethod
cla reset;

contents = cellstr(get(hObject,'String'));
popChoice = contents(get(hObject,'value'));

% switch popChoice
%     case 'Read from file'
%           set(handles.fileSrc,'Visible','on');
%         set(handles.getFnBtn,'Visible','on');
%     case 'Write Points'
%           set(handles.pointsTable,'Visible','on');
%         set(handles.methodMenu,'Visible','on');
%         set(handles.pointX,'Visible','on');
%         set(handles.pointY,'Visible','on');
%         set(handles.getFnBtn,'Visible','on');
%         set(handles.addPtBtn,'Visible','on');
% end
% contents = cellstr(get(hObject,'String'));
% popChoice = contents(get(hObject,'value'));
if(strcmp(popChoice,'Read from file'))
    set(handles.fileSrc,'Visible','on');
    set(handles.getFnBtn,'Visible','on');
    set(handles.pointsTable,'Visible','off');
    set(handles.methodMenu,'Visible','off');
    set(handles.pointX,'Visible','off');
    set(handles.pointY,'Visible','off');
    set(handles.polyOrder,'Visible','off');
    set(handles.addPtBtn,'Visible','off');
    set(handles.info,'Visible','off');    
    set(handles.srcLbl,'Visible','on');
    
end

if(strcmp(popChoice,'Write Points'))
    set(handles.fileSrc,'Visible','off');
    currentTable(1,1) = 0;
currentTable(1,2) = 0;
set(handles.subsPoint,'Visible','off');
set(handles.substituteBtn,'Visible','off');
set(handles.pointsTable,'Data', currentTable)
    set(handles.pointsTable,'Visible','on');
    set(handles.methodMenu,'Visible','on');
    set(handles.pointX,'Visible','on');
    set(handles.pointY,'Visible','on');
    set(handles.polyOrder,'Visible','on');
    set(handles.getFnBtn,'Visible','on');
    set(handles.addPtBtn,'Visible','on');
    set(handles.info,'Visible','on');
    set(handles.srcLbl,'Visible','off');

    
end
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function inputMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.



function fileSrc_Callback(hObject, eventdata, handles)
% hObject    handle to fileSrc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileSrc as text
%        str2double(get(hObject,'String')) returns contents of fileSrc as a double


% --- Executes during object creation, after setting all properties.
function fileSrc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileSrc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
