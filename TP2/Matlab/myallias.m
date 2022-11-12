clear all;
close all;

xsize = 512;
ysize = 512;

alpha1 = -pi/6;  % Rotationswinkel 1
alpha2 = pi/6;  % Rotationswinkel 2

% f2 = 380;     % Frequenz 2
% f1 = 180;     % Frequenz 1


f1 = 75;     % Frequenz 1
f2 = 75;     % Frequenz 2



a1 = 1;      % Amplitude 1
a2 = 1;      % Amplitude 2
phase1 = 0;
phase2 = 0;

[X,Y] = meshgrid([0:xsize-1]/xsize,[0:ysize-1]/ysize);
grid1 = cos(alpha1)*X + sin(alpha1)*Y;
grid2 = cos(alpha2)*X + sin(alpha2)*Y;

im=11;

%im = a1*sin(2*pi*f1*grid1 + phase1) + a2*sin(2*pi*f2*grid2 + phase2);
im=zeros(xsize,ysize);
imshow(im);
hold on
im =sign( a1*sin(2*pi*f1*grid1 + phase1));
imshow(im);
hold on
im=sign ( a2*sin(2*pi*f2*grid2 + phase2));
imshow(im);
%imshow(im,[-(a1+a2) a1+a2]);
%imshow(im);
%surf(im,'FaceColor','interp',...
%    'EdgeColor','none',...
%    'FaceLighting','phong');
%camlight left
%camlight headlight

figure;
IM = fft2(im);
IMd = log(1+abs(IM));
%imshow(fftshift(IMd/max(max(IMd))),[0 1]);
imshow((IMd/max(max(IMd))),[0 1]);

%surf(fftshift(abs(IM)),'FaceColor','interp',...
%    'EdgeColor','none',...
%    'FaceLighting','phong');
%camlight left
%camlight headlight