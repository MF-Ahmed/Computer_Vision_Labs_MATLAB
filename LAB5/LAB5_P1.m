clear all;close all;clc;

% manually define four points corners of a square

p1=[-2 -2 1];  % Add 1 to make homogenous
p2=[-2 2 1];
p3=[2 -2 1];
p4=[2 2 1];

tx = 1;  % translation to 1 unit along x axis
ty = 1;   % translation to 1 unit along y axis
X1 = [p1;p2;p3;p4];
theta= pi/2; % 90 degrees;
T = [cos(theta) sin(theta) tx;-sin(theta) cos(theta) ty;0 0 1];
X2 = X1*T
%%% find Homography H 
[H] = my_homography(X1,X2);
H  % display H
new_X2=X1*H;

diff=new_X2-X2
