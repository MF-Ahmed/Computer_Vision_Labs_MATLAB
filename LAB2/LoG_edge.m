
% Here we load our three test images and convolve them with 
% LoG kernal and disply The Edge map . 
% here spatial for LoG =3 ans Standard deviation = 1.5
% user can change there values and observe the result
%  we are basically implementing the Marr and Haldrith filter

clc;       % to clean up things a little bit 
clear all;
close all;


img1=imread('boccadasse.jpg'); % load  given images 
img2=imread('cameraman.tif');
img3=imread('car.bmp');


img1_1=img1(:,:,1);    % since its a color image we shall focus only on one
                        % image intansity matrix

spatial=3;              % different spatial support;
sigma=1; % standard deviation
z = LoG(sigma,spatial);

 j1=conv2(img1_1,z,'same');  % perform convoluation of image with mask
 figure;imagesc(uint8(j1));colormap gray;
 colorbar,title('Edge detection using LoG with sigma =1')
 
 j2=conv2(img2,z,'same'); % perform convoluation of image with mask
 figure;imagesc(uint8(j2));colormap gray;
   colorbar,title('Edge detection using LoG with sigma =1')
 
 j3=conv2(img3,z,'same');% perform convoluation of image with mask
 figure;imagesc(uint8(j3));colormap gray;
 colorbar,title('Edge detection using LoG with sigma =1')



