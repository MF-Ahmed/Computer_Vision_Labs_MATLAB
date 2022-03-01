close all
clear all


%PART 1: Image warping and bilinear interpolation
A = double(imread('boccadasse.jpg'));
figure;
image(A/255);title('Original')
%FORWARD WARPING
% TRASLATION
h=100;
k=100;
B=traslation_f(A,h,k);

% ROTATION
% Set angle of rotation
theta=-pi/3;
C=rotation_f(A,theta);

% SWIRL
% Set angle of rotation
theta=-pi/4;
D=swirl_f(A,theta);


%BACKWARD WARPING
% TRASLATION
h=-20;
k=-20;
B=traslation_b(A,h,k);

% ROTATION
% Set angle of rotation
theta=pi/3;
C=rotation_b(A,theta);

% SWIRL
% Set angle of rotation
theta=pi/4;
D=swirl_b(A,theta);

%PART 2: Color spaces 
color_spaces;