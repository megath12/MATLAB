function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 12-Dec-2016 02:31:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

ux=datestr(now);
set(handles.st1,'String',ux)

u2='70';
set(handles.st2,'String',u2)

u3='80 120 ';
set(handles.st3,'String',u3)

u4='98';
set(handles.st4,'String',u4)

u5='15';
set(handles.st5,'String',u5)

u6='36.8';
set(handles.st6,'String',u6)


t=[.5 .7 1.4 .9 .5 .5 -.5 9 -4 .5 .5 .5 1.1 1.9 2 1 .5 .5 .9 .5];
x=[t t t];
t=[1:1:60];
ti=0:0.001:60;

x1=interp1(t,x,ti,'pchip');
s=x;
for i=1:1000;
   s=[s x];
end

t1=[0 2 3.5 2 1.5 1.75 1.5 1 .6 .2];
x1=[t1 t1 t1];
t1=[1:1:30];
ti1=0:0.001:30;
x11=interp1(t1,x1,ti1,'pchip');
s1=x1;
for i1=1:1000
   s1=[s1 x1];
end

t2=[0 .7 1.8 2.8 3 2.8 2.6 2.3 2 1.6 1.1 .65 .3];
x2=[t2 t2 t2];
t2=[1:1:39];
ti2=0:0.001:39;
x12=interp1(t2,x2,ti2,'pchip');
s2=x2;
for i2=1:1000
   s2=[s2 x2];
end


for n=1:5000;
    l1=s(0+n:59+n);
    x4=interp1(t,l1,ti,'pchip');
    axes(handles.axes1)
    plot(x4,'g')
title('ECG','Color','g') % titulo y color de este
set(gca,'Color','k'); % color del interior de la grafica
axis([1000 60000 -4.5 9.5]) % fijar el rango que mostrara la grafica
       clear l1
       
    l11=s1(0+n:29+n);
    x5=interp1(t1,l11,ti1,'pchip');
    axes(handles.axes2)
    plot(x5,'c')
title('Plet','Color','c') % titulo y color de este
set(gca,'Color','k'); % color del interior de la grafica
axis([1000 30000 -2 6]) % fijar el rango que mostrara la grafica
       clear l11
       
    l12=s2(0+n:38+n);
    x6=interp1(t2,l12,ti2,'pchip');
    axes(handles.axes3)
    plot(x6,'y')
title('Resp','Color','y') % titulo y color de este
set(gca,'Color','k'); % color del interior de la grafica
axis([1000 39000 -6 10]) % fijar el rango que mostrara la grafica
    %pause(.001)%entre mas pequeño el valor de pause 
       clear l12
       

pause(0.05)

f2=ceil(rand*200); 
if f2>59&f2<101;
    set(handles.st2,'String',f2)
else
end


f3=ceil(rand*200); 
if f3>59&f3<101;
    u3=[f3 f3+40];
   set(handles.st3,'String',u3)
else
end


f4=ceil(rand*120); 
if f4>94&f4<101;
    set(handles.st4,'String',f4)
else
end       
  

f5=ceil(rand*30); 
if f5>14&f5<21;
    set(handles.st5,'String',f5)
else
end


f6=ceil(rand*50);
if f6<8
    f7=(f6/10)+36.5;
    set(handles.st6,'String',f7)
else
end 


end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pb2.
function pb2_Callback(hObject, eventdata, handles)
clc
clear all
close 
% hObject    handle to pb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
