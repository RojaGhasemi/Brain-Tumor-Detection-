function varargout = run(varargin)
% RUN MATLAB code for run.fig
%      RUN, by itself, creates a new RUN or raises the existing
%      singleton*.
%
%      H = RUN returns the handle to a new RUN or the handle to
%      the existing singleton*.
%
%      RUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUN.M with the given input arguments.
%
%      RUN('Property','Value',...) creates a new RUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before run_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to run_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help run

% Last Modified by GUIDE v2.5 17-Jul-2017 13:49:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @run_OpeningFcn, ...
                   'gui_OutputFcn',  @run_OutputFcn, ...
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


% --- Executes just before run is made visible.
function run_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to run (see VARARGIN)

% Choose default command line output for run
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes run wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = run_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;
clc;
tic;
%////////////////////////////////////////////////////////////
tic;
 classes=['b';'m';]; % i
 PName=['a';]; 
cd ('C:\Users\computer\Documents\MATLAB\segmentation Brain Tumor proposed\train\');
AllFile=dir('*.jpg');
r=1;
k1=1;
Col=1;
for i=1:2
    i;
    PerName='';
    for j=1:1
        j;
        cd ('C:\Users\computer\Documents\MATLAB\segmentation Brain Tumor proposed\train\');
        AllFile=dir('*.jpg');
        cc=1;        
        for ll=1:length(AllFile(:,1))
            TotalName(ll,1:length(AllFile(ll,1).name))=AllFile(ll,1).name;        
            if (strfind(TotalName(ll,:),classes(i,:)))
                if  (strfind(TotalName(ll,:),PName(j,:)))
                   PerName(cc,1:length(TotalName(ll,:)))=TotalName(ll,:);
                   cc=cc+1;
                end                
            end
        end
%        PerName        
     cd ('C:\Users\computer\Documents\MATLAB\segmentation Brain Tumor proposed');
     for k=1:length(PerName(:,1))
         im=imread(strcat('C:\Users\computer\Documents\MATLAB\segmentation Brain Tumor proposed\train\',PerName(k,:)));
         im=imresize(im,[300 300]);
fim=mat2gray(im);
level=graythresh(fim);
bwfim=im2bw(fim,0.1);
[bwfim0,level0]=fcmthresh(fim,0);
[bwfim1,level1]=fcmthresh(fim,1);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % gabor

norient=6;
mul=2;
for DWScale=0:2
   t1(DWScale+1).data=GabFilter(bwfim1,DWScale,norient,0,mul,0.65,1.5);        
end
fv=FeatureVector(t1);
 [COEFF,SCORE] = princomp(zscore(fv)');
 SCORE=SCORE';
 FVTrain(Col,1:10000)=SCORE(1,1:10000);
FVTrain(Col,10001)=i;
 Col=Col+1;
   k1=k1+1;
     end
    end
end
save('FVTrain.mat','FVTrain');
toc;
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, PathName] = uigetfile({'*.jpg;*.tif;*.bmp;*.gif','All Image Files'},'Select an Image');
fpath = strcat(PathName, FileName);
h1 = imread(fpath);
 save('h1.mat','h1');
axes(handles.axes1) % Select the proper axes
box on
imshow(h1);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('h1.mat');
im=imresize(h1,[300 300]);
fim=mat2gray(im);
level=graythresh(fim);
bwfim=im2bw(fim,0.1);
[bwfim0,level0]=fcmthresh(fim,0);
[bwfim1,level1]=fcmthresh(fim,1);
axes(handles.axes2) % Select the proper axes
box on
imshow(bwfim1);
save('bwfim1.mat');
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('bwfim1.mat');
norient=6;
mul=2;
for DWScale=0:2
   t1(DWScale+1).data=GabFilter(bwfim1,DWScale,norient,0,mul,0.65,1.5);        
end

figure; showimg(t1);
fvt=FeatureVector(t1);
 [COEFF,SCORE] = princomp(zscore(fvt)');
 SCORE=SCORE';
 FVTest(1,1:10000)=SCORE(1,1:10000);
FVTest(1,10001)=1;
save('FVTest.mat','FVTest');



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% clear all;
% clc;
load('FVTrain.mat');
load('FVTest.mat');
e=FVTrain(1:96,1:end-1);
e1=FVTest(1,1:end-1);
T=FVTrain(1:96,end);
T1=FVTest(1,end);
 model = svmtrain(e,T);
e=[];
T=[];
Class = svmclassify(model,e1);
 if (Class==1)
      set(handles.text1,'String','khoshkhim');
 end
 if (Class==2)
      set(handles.text1,'String','badkhim');
 end
len=find(Class==T1);
accnum=length(len);
accnum*100/size(e1,1)
