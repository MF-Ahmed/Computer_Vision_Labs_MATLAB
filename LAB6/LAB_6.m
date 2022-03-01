
clc;close all;clear all;
I1=imread('rds_L.jpg');
I2=imread('rds_R.jpg');

% I1=imread('shrub_L.jpg');
% I2=imread('shrub_R.jpg');
w=6;  %window size   2,4,6,8,
dmin=1;
dmax=6;
I1=rgb2gray(I1);
I2=rgb2gray(I2);
% I1=im2double(I1);
% I2=im2double(I2);
DLR=compute_disp(I1,I2,w,dmin,dmax);  % compute left to right disparity
figure,imagesc(uint8(DLR)),TITLE('Left to Right Disparity map'),colormap gray


DRL=compute_disp(I2,I1,w,-dmax,-dmin); % compute Right to left disparity
figure,imagesc(uint8(abs(DRL))),TITLE('Right to Left Disparity map'),colormap gray  % since DRL has nigative values so we take absolte values 
                                                                                    % for displaying puroses only.

D=left_right_con(DLR,DRL);   % calculate left right consistancy
figure,imagesc(uint8(D)),TITLE('Left Right consistency'),colormap gray