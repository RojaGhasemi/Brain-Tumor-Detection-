close all
clear;clc;
im=imread('IM-0001-0012.jpg');
% figure; imshow(im);
im=imresize(im,[300 300]);
fim=mat2gray(im);
figure; imshow(fim);
level=graythresh(fim);
bwfim=im2bw(fim,0.1);
[bwfim0,level0]=fcmthresh(fim,0);
[bwfim1,level1]=fcmthresh(fim,1);
% subplot(2,2,1);
% imshow(fim);title('Original');
%  subplot(2,2,2);
% imshow(bwfim);title(sprintf('Otsu,level=%f',level));
% subplot(2,2,3);
% imshow(bwfim0);title(sprintf('FCM0,level=%f',level0));
% subplot(2,2,4);
imshow(bwfim1);title(sprintf('FCM1,level=%f',level1));
% imwrite(bwfim1,'fliver6.jpg');
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % gabor
norient=6;
mul=2;
for DWScale=0:2
   t1(DWScale+1).data=GabFilter(bwfim1,DWScale,norient,0,mul,0.65,1.5);        
end
save('t1.mat','t1');
figure; showimg(t1);
fv=FeatureVector(t1);