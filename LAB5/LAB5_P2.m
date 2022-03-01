clc;close all;clear all;
I1=imread('original.jpg');
figure,imagesc(I1)
[x1,y1]=ginput(4);

% Read 1st set of coordinates form image
x1=round(x1);
y1=round(y1);
X1=[x1,y1,ones(4,1)];
% Read 2nd set of coordinates form image
[x2,y2]=ginput(4);
x2=round(x2);
y2=round(y2);
X2=[x2,y2,ones(4,1)];
% Calculate Homography Matrix H
H = my_homography(X1,X2);
new_X2=X2*H;
 % Normalize the points
for i=1:4
    for j=1:3
        new_X2(i,j)=new_X2(i,j)/new_X2(i,3);
    end
end
diff=new_X2-X2

% Apply Homography forward warping
[I2] = forward_warp(I1,H);

% Apply Homography backward warping with biliner interpolation
[I2] = back_warp(I1,H);



