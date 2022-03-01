clc;close all;clear all;
% Load the Two Image files with corresponding 
% Image coordinates 
r1=load('Rubik1.points');
r2=load('Rubik2.points');
im1=imread('Rubik1.pgm');
im2=imread('Rubik2.pgm');
np=8; % take a sample size of Fist 8 points
r1_p=r1(1:np,:);
r2_p=r2(1:np,:);
[F]=eight_point(np,r1_p,r2_p,im1,im2)% This finction computes matrix A and Displapys the Images with 
                                     % Corresponding Epipolar Points, it
                                     % Returns the Fundamental Matrix F
 %% finding the epipoles

[U,~,V]=svd(F);
%on the left image
%epipole eR is the right null space of F
eR=V(:,3)/V(3,3)

%on the right image
%epipole eR is the left null space of F
eL=U(:,3)/U(3,3)
  
r1=load('Mire1.points');
r2=load('Mire2.points');
im1=imread('Mire1.pgm');
im2=imread('Mire2.pgm');
np=10;
r1_p=r1(1:np,:);
r2_p=r2(1:np,:);
[F]=eight_point(np,r1_p,r2_p,im1,im2)
 %% finding the epipoles

[U,~,V]=svd(F);
%on the left image
%epipole eR is the right null space of F
eR=V(:,3)/V(3,3)

%on the right image
%epipole eR is the left null space of F
eL=U(:,3)/U(3,3)

