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

% Last Modified by GUIDE v2.5 11-May-2018 15:09:50

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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
cla reset;
set(handles.uitable1,'Data', cell(0,0));
contents = cellstr(get(hObject,'String'));
popChoice = contents(get(hObject,'value'));
set(handles.finish,'Visible','on')
set(handles.nextbtn,'Visible','on')
set(handles.initvaluetxt,'Visible','off')
set(handles.initvalue,'Visible','off')
set(handles.lowertxt,'Visible','off')
set(handles.lower,'Visible','off')
set(handles.uppertxt,'Visible','off')
set(handles.upper,'Visible','off')
set(handles.maxiter,'Visible','off')
set(handles.maxitertxt,'Visible','off')
set(handles.maxerr,'Visible','off')
set(handles.maxerrtxt,'Visible','off')
set(handles.axes1,'Visible','off')
set(handles.uitable1,'Visible','off')
set(handles.unknows,'Visible','off')
set(handles.unknowstxt,'Visible','off')
set(handles.result,'Visible','off')
set(handles.time,'Visible','off')
set(handles.resulttxt,'Visible','off')
set(handles.timetxt,'Visible','off')
set(handles.result,'String', ' ');
set(handles.time,'String',' ');
set(handles.axes1,'Visible','on')
if(strcmp(popChoice,'Bisection') || strcmp(popChoice,'False Position') || strcmp(popChoice,'Secant'))
    set(handles.lower,'Visible','on')
    set(handles.lowertxt,'Visible','on')
    set(handles.upper,'Visible','on')
    set(handles.uppertxt,'Visible','on')
    set(handles.maxiter,'Visible','on')
    set(handles.maxitertxt,'Visible','on')
    set(handles.maxerr,'Visible','on')
    set(handles.maxerrtxt,'Visible','on')
    set(handles.axes1,'Visible','on')
    set(handles.uitable1,'Visible','on')
    set(handles.result,'Visible','on')
    set(handles.time,'Visible','on')
    set(handles.resulttxt,'Visible','on')
    set(handles.timetxt,'Visible','on')
elseif (strcmp(popChoice,'Fixed Point') ||  strcmp(popChoice,'Newton Raphson'))
    
    set(handles.initvaluetxt,'Visible','on')
    set(handles.initvalue,'Visible','on')
    set(handles.maxiter,'Visible','on')
    set(handles.maxitertxt,'Visible','on')
    set(handles.maxerr,'Visible','on')
    set(handles.maxerrtxt,'Visible','on')
    set(handles.axes1,'Visible','on')
    set(handles.uitable1,'Visible','on')
    set(handles.result,'Visible','on')
    set(handles.time,'Visible','on')
    set(handles.resulttxt,'Visible','on')
    set(handles.timetxt,'Visible','on')
elseif strcmp(popChoice,'Birge Vieta')
    set(handles.initvaluetxt,'Visible','on')
    set(handles.initvalue,'Visible','on')
    set(handles.maxiter,'Visible','on')
    set(handles.maxitertxt,'Visible','on')
    set(handles.maxerr,'Visible','on')
    set(handles.maxerrtxt,'Visible','on')
    set(handles.axes1,'Visible','on')
    set(handles.uitable1,'Visible','on')
    set(handles.result,'Visible','on')
    set(handles.time,'Visible','on')
    set(handles.resulttxt,'Visible','on')
    set(handles.timetxt,'Visible','on')
    setIndex(1);
elseif (strcmp(popChoice,'Gauss Jordon'))
    
    set(handles.unknows,'Visible','on')
    set(handles.unknowstxt,'Visible','on')
    set(handles.result,'Visible','on')
    set(handles.time,'Visible','on')
    set(handles.resulttxt,'Visible','on')
    set(handles.timetxt,'Visible','on')
    setIndex(1);
elseif (strcmp(popChoice,'General Method'))
    set(handles.uitable1,'Visible','on')
    set(handles.nextbtn,'Visible','off')
    set(handles.time,'Visible','on')
    set(handles.timetxt,'Visible','on')
end
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function functionText_Callback(hObject, eventdata, handles)
% hObject    handle to functionText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of functionText as text
%        str2double(get(hObject,'String')) returns contents of functionText as a double




% --- Executes during object creation, after setting all properties.
function functionText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initvaluetxt_Callback(hObject, eventdata, handles)
% hObject    handle to initvaluetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initvaluetxt as text
%        str2double(get(hObject,'String')) returns contents of initvaluetxt as a double


% --- Executes during object creation, after setting all properties.
function initvaluetxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initvaluetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');  
end



function lowertxt_Callback(hObject, eventdata, handles)
% hObject    handle to lowertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowertxt as text
%        str2double(get(hObject,'String')) returns contents of lowertxt as a double


% --- Executes during object creation, after setting all properties.
function lowertxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function uppertxt_Callback(hObject, eventdata, handles)
% hObject    handle to uppertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uppertxt as text
%        str2double(get(hObject,'String')) returns contents of uppertxt as a double


% --- Executes during object creation, after setting all properties.
function uppertxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uppertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxitertxt_Callback(hObject, eventdata, handles)
% hObject    handle to uppertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uppertxt as text
%        str2double(get(hObject,'String')) returns contents of uppertxt as a double


% --- Executes during object creation, after setting all properties.
function maxitertxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uppertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxerrtxt_Callback(hObject, eventdata, handles)
% hObject    handle to maxerrtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxerrtxt as text
%        str2double(get(hObject,'String')) returns contents of maxerrtxt as a double


% --- Executes during object creation, after setting all properties.
function maxerrtxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxerrtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finish.
function  finish_Callback(hObject, eventdata, handles)
% hObject    handle to finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contentRead = get(handles.readmenu,'String');
valueRead = contentRead{get(handles.readmenu,'Value')};
filename=get(handles.functionText,'String');
switch valueRead
    case 'Read from File'
        
        if ~isempty(filename)
            
            array = Read_File(filename);
            method=array(1);
         
            switch method
                case '1'
                    value='Bisection';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '2'
                    value='False Position';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '3'
                    value='Fixed Point';
                    initValue = str2double(array(3));
                case '4'
                    value='Newton Raphson';
                    initValue = str2double(array(3));
                case '5'
                    value='Secant';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '6'
                    value='Birge Vieta';
                    initValue = str2double(array(3));
                case '7'
                    value='General Method';
            end
        end
    case 'Write Function'
        lower = str2double(get(handles.lowertxt, 'String'));
        upper = str2double(get(handles.uppertxt,'String'));
        initValue = str2double(get(handles.initvaluetxt,'String'));

        contents = get(handles.popupmenu1,'String');
        value = contents{get(handles.popupmenu1,'Value')};
        
end


[root,data,func,result,steps,time,final] = getResult(handles);
[rowsz,colsz] = size(data);
gauss=0;
switch value
    case 'Bisection'
        x = -(abs(lower) + abs(upper)):0.1:(abs(lower) + abs(upper));
        z = x*0;
    case 'False Position'
        x = -(abs(lower) + abs(upper)):0.1:(abs(lower) + abs(upper));
        z = x*0;
end
switch value
    case 'Bisection'
        x_mid=data(rowsz,3);
        cla reset;
        hold on;
        grid on;
        H = plot(x,double(subs(func, x)),'r',x,z,'k');
         title('{\fontsize{18}\color[rgb]{white}Graph of Bisection method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}y}')
        M = line([x_mid x_mid], get(gca, 'ylim'),'color','b');
        set(M,'LineWidth',2.0);
         handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
        legend(handles.axes1,'f(x)' ,'root');
    case 'False Position'
        x_lower =data(rowsz,1);
        x_upper=data(rowsz,2);
        x_mid=data(rowsz,3);
        y_l = subs(func, x_lower);
        y_u = subs(func, x_upper);
        cla reset;
        H = plot(x,double(subs(func, x)),'r',x,z,'k');
        hold on;
        grid on;
        set(H,'LineWidth',1.0);
         title('{\fontsize{18}\color[rgb]{white}Graph of False Position method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}y}')
        L = plot([x_upper x_lower], [y_u y_l]);
        set(L,'LineWidth',2.0);
        U = plot(x_lower, y_l,'r*');
        set(U,'LineWidth',2.0);
        M = plot(x_upper, y_u,'r*');
        set(M,'LineWidth',2.0);
        R =  plot(x_mid,0,'r*');
        set(R,'LineWidth',2.0);
         handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
        legend(handles.axes1,'f(x)','axis','line','xlower','xupper');
    case 'Newton Raphson'
        hold on
        grid on
        y = abs(initValue);
        x= -(y*2)-2:0.1:(y*2)+2;
        z=x*0;
        H = plot(x,double(subs(func, x)),'r',x,z,'k');
        title('{\fontsize{18}\color[rgb]{white}Graph of Newton Raphson method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}F(x)}')
        L= line([root root], get(gca,'ylim'),'color','b');
        set(L,'LineWidth',2.0)
         handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
        legend(handles.axes1,'f(x)' ,'root');
    case 'Gauss Jordon'
        set(handles.result,'String',result);
        set(handles.time,'String',time);
        gauss=1;
    case 'Fixed Point'
        check = checkConvergence(func ,initValue);
        if(check == 1)
            xr=data(rowsz,1);
            hold on
            l = plot(xr ,xr,'g*');
            hold on
            line([xr xr], get(gca, 'ylim'),'color','y');
            title('{\fontsize{18}\color[rgb]{white}Graph of Fixed Point method}')
             handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
            legend(handles.axes1,'x=y' ,'g(x)','axis','intersect','root');
        end
    case 'General Method'
        sortedData = sort(data);
        minRoot=sortedData(1);
        n=length(sortedData);
        maxRoot=sortedData(n);
        x= -10:0.1:10;
        hold on;
        grid on;
        z=x*0;
        title('{\fontsize{18}\color[rgb]{white}Graph of General Method method}')
        plot(x,double(subs(func, x)),'r',x,z,'k');
        for i=1:n
            L= line([sortedData(i) sortedData(i)], get(gca,'ylim'),'color','b');
            set(L,'LineWidth',2.0) 
        end
         handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
        legend(handles.axes1,'f(x)','root');
    case 'Secant'
        
        x0=data(1,1);
        x1=data(1,2);
        xr=data(1,3);
        x = -(abs(x0) + abs(x1)):0.1:(abs(x0) + abs(x1));
        z = x*0;
        y_l = subs(func, x0);
        y_u = subs(func, x1);
        cla reset;
        H = plot(x,double(subs(func, x)),'r',x,z,'k');
        hold on;
        grid on;
        set(H,'LineWidth',1.0);
        title('{\fontsize{18}\color[rgb]{white}Graph of Secant method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}y}')
        L = plot([x1 x0 xr], [y_u y_l 0],'color','b');
        set(L,'LineWidth',2.0);
        U = plot(x0, y_l,'r*');
        set(U,'LineWidth',2.0);
        M = plot(x1, y_u,'r*');
        set(M,'LineWidth',2.0);
        R =  plot(xr,0,'k*');
        set(R,'LineWidth',2.0);
       handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
        legend(handles.axes1,'f(x)' ,'axis','line','xi','xi-1','xi+1');
    case'Birge Vieta'
           hold on
        grid on
        y = abs(initValue);
        x= -(y*2)-2:0.1:(y*2)+2;
        z=x*0;
        H = plot(x,double(subs(func, x)),'r',x,z,'k');
        title('{\fontsize{18}\color[rgb]{white}Graph of Birge Vieta method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}F(x)}')
          handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';       
         legend(handles.axes1,'f(x)');       
        
end
if (gauss ==0)
    set(handles.result,'String', root);
    set(handles.uitable1,'Data', data);
    set(handles.time,'String',time);
    
end




function [root,data,func,result,steps,time,final]= getResult(handles)
contentRead = get(handles.readmenu,'String');
valueRead = contentRead{get(handles.readmenu,'Value')};
filename=get(handles.functionText,'String');
switch valueRead
    case 'Read from File'
        
        if ~isempty(filename)
            
            array = Read_File(filename);
            method=array(1);
            func = array(2);
            if(size(array,2) == 5)
                maxErr =str2double( array(4));
                maxIter = str2double(array(5));
            elseif(size(array,2) == 3)
                maxErr= 0.0001;
                maxIter = 50;
            elseif(size(array,2) == 4)
                if(str2double(array(4)) < 1)
                    maxErr = array(4);
                    maxIter = 50;
                else
                    maxIter = array(4);
                    maxErr= 0.0001;
                end
            end
            switch method
                case '1'
                    value='Bisection';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '2'
                    value='False Position';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '3'
                    value='Fixed Point';
                    initValue = str2double(array(3));
                case '4'
                    value='Newton Raphson';
                    initValue = str2double(array(3));
                case '5'
                    value='Secant';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '6'
                    value='Birge Vieta';
                    initValue = str2double(array(3));
                case '7'
                    value='General Method';
            end
        end
        
    case 'Write Function'
        lower = str2double(get(handles.lowertxt, 'String'));
        upper = str2double(get(handles.uppertxt,'String'));
        initValue = str2double(get(handles.initvaluetxt,'String'));
        maxErr = get(handles.maxerrtxt,'String');
        maxIter = get(handles.maxitertxt,'String');
        func = get(handles.functionText,'String');
        contents = get(handles.popupmenu1,'String');
        value = contents{get(handles.popupmenu1,'Value')};
        if(isempty(maxErr))
            maxErr= 0.0001;
        else
            maxErr = str2double(get(handles.maxerrtxt,'String'));
        end
        if(isempty(maxIter))
            maxIter= 50;
        else
            maxIter = str2double(get(handles.maxitertxt,'String'));
        end
end



if  (~isempty(func))
    
    myFunc =inline(char(func));
    set(handles.uitable1,'RowName',{'' ''  ''});
    switch value
        case 'Bisection'
            result='';
            steps='';
            final='';
            if ~isempty(lower) && ~isempty(upper)
                if (myFunc(lower) * myFunc(upper) > 0)
                    
                    msgbox('Please enter different limits');
                else
                    x_itr = 0;
                    x_mid = (lower + upper ) /2;
                    x_prev = x_mid +1;
                    [root,data,time] = Bisection(lower,upper,x_mid,x_prev,x_itr,maxErr,func,maxIter);
                    set(handles.uitable1,'ColumnName',{'xl' 'xu' 'xm' 'error'});
                    
                end
            end
        case 'False Position'
            result='';
            steps='';
            final='';
            if ~isempty(lower) && ~isempty(upper)
                if (myFunc(lower) * myFunc(upper) > 0)
                    msgbox('Please enter different limits');
                else
                    x_itr = 0;
                    
                    x_mid = ((lower* myFunc(upper)) - (upper* myFunc(lower)) ) /(myFunc(upper) - myFunc(lower));
                    x_prev = x_mid +1;
                    [root,data,time] = FalsePosition(lower,upper,x_mid,x_prev,x_itr,maxErr,myFunc,maxIter);
                    set(handles.uitable1,'ColumnName',{'xl' 'xu' 'xm' 'error'});
                end
            end
        case 'Secant'
            result='';
            steps='';
            final='';
            if ~isempty(lower) && ~isempty(upper)
                [root,data,time] = secant(lower,upper,maxIter,maxErr,func);
                set(handles.uitable1,'ColumnName',{'xi-1' 'xi' 'xr' 'error'});
            end
        case 'Fixed Point'
            result='';
            steps=''; 
            final='';
            if ~isempty(initValue)
                check = checkConvergence(func ,initValue);
                if(check == 1)
                    [root,data,time] = FixedPointMethod (func, initValue, maxErr, maxIter);
                    set(handles.uitable1,'ColumnName',{'xi' 'xi-1'  'error'});
                else
                    root='';
                    data='';
                    steps='';
                    result='';
                    time='';
                    set(handles.uitable1,'Data', cell(0,0));
                    msgbox('This initial point diverges.');
                end
            end
        case 'Newton Raphson'
            result='';
            steps='';
            
            final='';
            if ~isempty(initValue)
                
                [root, iterations,data,time] = newton_raphson(initValue,maxErr, maxIter, myFunc);
                set(handles.uitable1,'ColumnName',{'xi'  'error'});
            end
        case 'Birge Vieta'
            result='';
            steps='';
            if ~isempty(initValue)
                [finalRoot,data,final,time]=BirgeVieta_method(func,initValue,maxIter,maxErr);
                root=finalRoot;
                set(handles.uitable1,'ColumnName',{'xi'  'error'});
            end
        case 'Gauss Jordon'
            root='';
            data='';
            
            final='';
            labels=get(handles.unknowstxt,'String');
            data1 = strsplit(func,', ');
            finalres={};
            eqn={};
            eval(['syms ' labels]);
            for i=1:numel(data1)
                finalres=[finalres;char(data1(i))];
            end
            for  c = 1:numel(data1)
                eqn = [eqn,eval(strrep(char(finalres(c)),'=','=='))];
            end
            [A,B] = equationsToMatrix(eqn);
            
            [result, steps,time] = gauss_jordon(A, B);
            
        case 'General Method'
            [data,time]= generalMethod(func);
            data=data.';
            root='';
            result='';
            steps='';
            
            final='';
            if(length(data) == 0)
                msgbox('No Roots');
            end
            
    end
end

function resulttxt_Callback(hObject, eventdata, handles)
% hObject    handle to resulttxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resulttxt as text
%        str2double(get(hObject,'String')) returns contents of resulttxt as a double


% --- Executes during object creation, after setting all properties.
function resulttxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resulttxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on key press with focus on uitable1 and none of its controls.
function uitable1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in nextbtn.

function nextbtn_Callback(hObject, eventdata, handles)
% hObject    handle to nextbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contentRead = get(handles.readmenu,'String');
valueRead = contentRead{get(handles.readmenu,'Value')};
filename=get(handles.functionText,'String');
switch valueRead
    case 'Read from File'
        
        if ~isempty(filename)
            
            array = Read_File(filename);
            method=array(1);
            func = array(2);
            
            switch method
                case '1'
                    value='Bisection';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '2'
                    value='False Position';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '3'
                    value='Fixed Point';
                    initValue = str2double(array(3));
                case '4'
                    value='Newton Raphson';
                    initValue = str2double(array(3));
                case '5'
                    value='Secant';
                    data = strsplit(array(3),' ');
                    lower = str2double(data(1));
                    upper = str2double(data(2));
                case '6'
                    value='Birge Vieta';
                    initValue = str2double(array(3));
  
                case '7'
                    value='General Method';
            end
        end
    case 'Write Function'
        lower = str2double(get(handles.lowertxt, 'String'));
        upper = str2double(get(handles.uppertxt,'String'));
        initValue = str2double(get(handles.initvaluetxt,'String'));
        
        contents = get(handles.popupmenu1,'String');
        value = contents{get(handles.popupmenu1,'Value')};
        
end
[root,data,func,result,steps,time,final]=getResult(handles);

printedData = get(handles.uitable1,'Data');
[rowsz,colsz] = size(data);
[height,width] = size(printedData);
[heights,widths,depths]=size(steps);

if (strcmp(value,'Birge Vieta'))
      set(handles.uitable1,'ColumnName',{'' ''});
   set(handles.uitable1,'RowName',{'a' 'b' 'c'});
    rowsz=0;
     data='';
    
    if(getIndex()<length(final))
        
        set(handles.uitable1,'Data',final(:,:,getIndex())); 
        setIndex(getIndex()+1);
       
    
    elseif(getIndex()==length(final))
        set(handles.result,'String',root);
         set(handles.time,'String',time);
            hold on
        grid on
        y = abs(initValue);
        x= -(y*2)-2:0.1:(y*2)+2;
        z=x*0;
        H = plot(x,double(subs(func, x)),'r',x,z,'k');
        title('{\fontsize{18}\color[rgb]{white}Graph of Birge Vieta method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}F(x)}')
                 handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
                legend(handles.axes1,'f(x)' );
    end
elseif (strcmp(value,'Gauss Jordon'))
    rowsz=0;
    if(getIndex() <= depths )
    
    set(handles.result,'String',char(steps(:,:,getIndex())));
    setIndex(getIndex()+1);
    
elseif(getIndex() == depths+1)
    set(handles.time,'String',time);
    set(handles.result,'String',result);
    end
end
if rowsz~=0
if(height < rowsz)
    
    printedData = data(1 : height+1, 1:colsz);
    set(handles.uitable1, 'Data', printedData);
    switch value
        case 'Bisection'
            x = -(abs(lower) + abs(upper)):0.1:(abs(lower) + abs(upper));
            z = x*0;
            x_lower =data(height+1,1);
            x_upper=data(height+1,2);
            x_mid=data(height+1,3);
            cla reset;
            hold on;
            grid on;
            H = plot(x,double(subs(func, x)),'r',x,z,'k');
             title('{\fontsize{18}\color[rgb]{white}Graph of Bisection method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}y}')
            L = line([x_lower x_lower], get(gca, 'ylim'),'color','g');
            set(L,'LineWidth',2.0);
            U = line([x_upper x_upper], get(gca, 'ylim'),'color','y');
            set(U,'LineWidth',2.0);
            M = line([x_mid x_mid], get(gca, 'ylim'),'color','b');
            set(M,'LineWidth',2.0);
             handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
            legend(handles.axes1,'f(x)','axis','xlower','xupper','xmid');
        case 'False Position'
            x = -(abs(lower) + abs(upper)):0.1:(abs(lower) + abs(upper));
            z = x*0;
            x_lower =data(height+1,1);
            x_upper=data(height+1,2);
            x_mid=data(height+1,3);
            y_l = subs(func, x_lower);
            y_u = subs(func, x_upper);
            cla reset;
            H = plot(x,double(subs(func, x)),'r',x,z,'k');
            hold on;
            grid on;
            set(H,'LineWidth',1.0);
            title('{\fontsize{18}\color[rgb]{white}Graph of False Position method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}y}')
            L = plot([x_upper x_lower], [y_u y_l]);
            set(L,'LineWidth',2.0);
            U = plot(x_lower, y_l,'r*');
            set(U,'LineWidth',2.0);
            M = plot(x_upper, y_u,'r*');
            set(M,'LineWidth',2.0);
            R =  plot(x_mid,0,'r*');
            set(R,'LineWidth',2.0);
             handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
            legend(handles.axes1,'f(x)','axis','line','xlower','xupper');
        case 'Secant'
            x = -(abs(lower) + abs(upper)):0.1:(abs(lower) + abs(upper));
            z = x*0;
            x0=data(height+1,1);
            x1=data(height+1,2);
            xr=data(height+1,3);
            y_l = subs(func, x0);
            y_u = subs(func, x1);
            cla reset;
            H = plot(x,double(subs(func, x)),'r',x,z,'k');
            hold on;
            grid on;
            set(H,'LineWidth',1.0);
            title('{\fontsize{18}\color[rgb]{white}Graph of Secant method}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}y}')
            L = plot([x1 x0 xr], [y_u y_l 0],'color','b');
            set(L,'LineWidth',2.0);
            U = plot(x0, y_l,'r*');
            set(U,'LineWidth',2.0);
            M = plot(x1, y_u,'r*');
            set(M,'LineWidth',2.0);
            R =  plot(xr,0,'k*');
            set(R,'LineWidth',2.0);
             handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
            legend(handles.axes1,'f(x)' ,'axis','line','xi','xi-1','xi+1');
        case 'Newton Raphson'
            if height ==0
                xr=data(1,1);
                cla reset;
                hold on
                grid on
                y = abs(initValue);
                x= -(y*2)-2:0.1:(y*2)+2;
                z=x*0;
                H = plot(x,double(subs(func, x)),'r',x,z,'k');
                title('{\fontsize{18}\color[rgb]{white}Graph of Newton Raphson method}')
                xlabel('{\fontsize{18}\color{white}xi}')
                ylabel('{\fontsize{18}\color{white}F(xi)}')
                L= line([xr xr], get(gca,'ylim'),'color','b');
                set(L,'LineWidth',2.0)
            else
                x0=data(height,1);
                x1=data(height+1,1);
                cla reset;
                hold on
                grid on
                y = abs(initValue);
                x= -(y*2)-2:0.1:(y*2)+2;
                z=x*0;
                H = plot(x,double(subs(func, x)),'r',x,z,'k');
                title('{\fontsize{18}\color[rgb]{white}Graph of Newton Raphson method}')
                xlabel('{\fontsize{18}\color{white}xi}')
                ylabel('{\fontsize{18}\color{white}F(xi)}')
                L= line([x0 x0], get(gca,'ylim'),'color','b');
                U= line([x1 x1], get(gca,'ylim'),'color','g');
                set(L,'LineWidth',2.0)
                set(U,'LineWidth',2.0)
            end
             handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
            legend(handles.axes1,'f(x)','axis' ,'xi','xi+1');
        case 'Fixed Point'
            
            check = checkConvergence(func ,initValue);
            if(check == 1)
                
                xr=data(height+1,1);
                x_old=data(height+1,2);
                func = inline(char(func));
                t = double(func(xr) + double (xr));
                hold on
                plot([x_old x_old],[x_old xr],'k-');
                hold on
                plot([x_old xr],[x_old t],'k--');
                
            end
             handles.axes1.XAxis.Color = 'g';
       handles.axes1.YAxis.Color = 'g';
            legend(handles.axes1,'x=y','g(x)');
    end

else 
        set(handles.uitable1, 'Data', printedData);
        set(handles.result,'String', root);
        set(handles.time,'String',time);
        switch value 
            case 'Fixed Point'
    if ~isempty(data)
        xr=data(rowsz,1);
        
        hold on
        l = plot(xr ,xr,'g*');
        hold on
        line([xr xr], get(gca, 'ylim'),'color','y');
    end
        end
end
end

function setIndex(index)
global x;
x= index;

function r=getIndex()
global x;
r=x;

function numbertxt_Callback(hObject, eventdata, handles)
% hObject    handle to numbertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numbertxt as text
%        str2double(get(hObject,'String')) returns contents of numbertxt as a double


% --- Executes during object creation, after setting all properties.
function numbertxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numbertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function unknowstxt_Callback(hObject, eventdata, handles)
% hObject    handle to unknowstxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of unknowstxt as text
%        str2double(get(hObject,'String')) returns contents of unknowstxt as a double


% --- Executes during object creation, after setting all properties.
function unknowstxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unknowstxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in entertxt.
function entertxt_Callback(hObject, eventdata, handles)
% hObject    handle to entertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if ~isempty(get(handles.numbertxt,'String'))
% numOfUnknows=str2double(get(handles.numbertxt,'String'));
% func_iter=get(handles.functionText,'String');
% funcs = get(handles.functable,'Data');
% [height] = size(funcs);
% disp(get(handles.numbertxt,'String'))
% disp(func_iter)
% if height < numOfUnknows
%   funcs(end+1) = func_iter;
%   set(handles.functable,'Data', funcs);
% end
% end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in readmenu.
function readmenu_Callback(hObject, eventdata, handles)
% hObject    handle to readmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns readmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from readmenu
cla reset;
set(handles.functionText,'Visible','off');
set(handles.text2,'Visible','off');
set(handles.popupmenu1,'Visible','off');
contents = cellstr(get(hObject,'String'));
popChoice = contents(get(hObject,'value'));
set(handles.finish,'Visible','off')
set(handles.nextbtn,'Visible','off')
set(handles.uitable1,'Visible','off')
set(handles.axes1,'Visible','off')
set(handles.timetxt,'Visible','off')
set(handles.time,'Visible','off')
set(handles.resulttxt,'Visible','off')
set(handles.result,'Visible','off')
set(handles.initvaluetxt,'Visible','off')
set(handles.filename,'Visible','off')
set(handles.initvalue,'Visible','off')
set(handles.lowertxt,'Visible','off')
set(handles.lower,'Visible','off')
set(handles.uppertxt,'Visible','off')
set(handles.upper,'Visible','off')
set(handles.maxiter,'Visible','off')
set(handles.maxitertxt,'Visible','off')
set(handles.maxerr,'Visible','off')
set(handles.maxerrtxt,'Visible','off')

if (strcmp(popChoice, 'Write Function'))
    set(handles.functionText,'Visible','on');
    set(handles.text2,'Visible','on');
    set(handles.popupmenu1,'Visible','on');
    set(handles.filename,'Visible','off')
    set(handles.functionText,'Visible','on')
    
else
    cla reset;
    set(handles.uitable1,'Data', cell(0,0));
    set(handles.finish,'Visible','on')
    set(handles.nextbtn,'Visible','on')
    set(handles.uitable1,'Visible','on')
    set(handles.axes1,'Visible','on')
    set(handles.timetxt,'Visible','on')
    set(handles.time,'Visible','on')
    set(handles.resulttxt,'Visible','on')
    set(handles.result,'Visible','on')
    set(handles.filename,'Visible','on')
    set(handles.functionText,'Visible','on')
    setIndex(1); %birge vieta next
end
% --- Executes during object creation, after setting all properties.
function readmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to readmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
