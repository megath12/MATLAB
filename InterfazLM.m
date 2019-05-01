
function varargout = InterfazLM(varargin)
% INTERFAZLM MATLAB code for InterfazLM.fig
%      INTERFAZLM, by itself, creates a new INTERFAZLM or raises the existing
%      singleton*.
%
%      H = INTERFAZLM returns the handle to a new INTERFAZLM or the handle to
%      the existing singleton*.
%
%      INTERFAZLM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZLM.M with the given input arguments.
%
%      INTERFAZLM('Property','Value',...) creates a new INTERFAZLM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterfazLM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterfazLM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfazLM

% Last Modified by GUIDE v2.5 04-Oct-2018 14:29:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfazLM_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfazLM_OutputFcn, ...
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


% --- Executes just before InterfazLM is made visible.
function InterfazLM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterfazLM (see VARARGIN)

% Choose default command line output for InterfazLM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfazLM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterfazLM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb1.

function pb1_Callback(hObject, eventdata, handles)

delete(instrfind); %borrar todos los puertos
clc %limpiar pantalla

K=serial('COM7','BaudRate',9600,'TimeOut',200,'Terminator','LF'); %establecer comunicacion seril en puerto 5
fopen(K);
N=20000;

for L=1:N;
    p=fscanf(K); %Escanear puerto serial
    set(handles.txt1,'String',p);% tomar valor en Interfaz grafica 
    p1=str2double(p); %casting tipo de variables
    stem(L,p1,'r')    %realizar grafica discreta
    title('Levitador','Color','b') % titulo y color de este
    set(gca,'Color','c'); % color del interior de la grafica
    xlabel('Tiempo \rightarrow');
    ylabel('Distancia(cm)\rightarrow');
    axis([L-2 L+2 0 200]);
    grid on
    drawnow
    pause(0.05);
    clc
end

fclose(K);

%%%% Valor=get(handles.txt1,'String');
%%%% set(handles.edt1,'String',Valor);


% hObject    handle to pb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edt1_Callback(hObject, eventdata, handles)
% hObject    handle to edt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt1 as text
%        str2double(get(hObject,'String')) returns contents of edt1 as a double


% --- Executes during object creation, after setting all properties.
function edt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over txt1.
function txt1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to txt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pb2.
function pb2_Callback(hObject, eventdata, handles)

% delete K
% delete a
% a=arduino('COM6');
% L=get(handles.edt1,'String');
% %%methods(a);
% L1=str2double(L);
% writePWMVoltage(a,'D9',L1);
% pause(5);


% s  ----------------tr2num()
delete(instrfind)
clc

K=serial('COM7','BaudRate',9600,'TimeOut',100,'Terminator','LF');
fopen(K);
P=90000;
for U=1:P; 
    L=get(handles.edt1,'String');
    if L>0;
        fwrite(K,L,'int8');
        set(handles.txt1,'String',L);% tomar valor en Interfaz grafica
        stem(U,L,'r')
        title('Levitador','Color','b') % titulo y color de este
        set(gca,'Color','c'); % color del interior de la grafica
        xlabel('Tiempo \rightarrow');
        ylabel('Distancia(cm)\rightarrow');
        axis([L-2 L+2 0 200]);
        grid on
        drawnow
        pause(0.1);
        %fprintf(L);
        %pause(0.1);
    else 
        p=fscanf(K); %Escanear puerto serial
        set(handles.txt1,'String',p);% tomar valor en Interfaz grafica
        p1=str2double(p); %casting tipo de variables
        stem(U,p1,'r')
        title('Levitador','Color','b') % titulo y color de este
        set(gca,'Color','c'); % color del interior de la grafica
        xlabel('Tiempo \rightarrow');
        ylabel('Distancia(cm)\rightarrow');
        axis([L-2 L+2 0 200]);
        grid on
        drawnow
        pause(0.1);
    end
    clc
end














%pause(5);
%fclose(K);

%set(handles.txt1,'String',k1);
%fclose(s);

% hObject    handle to pb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pb3.
function pb3_Callback(hObject, eventdata, handles)

delete(instrfind);
delete K
delete a
clc
clear all


% hObject    handle to pb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function graf1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to graf1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
