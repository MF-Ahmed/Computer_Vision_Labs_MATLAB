%The function will visit all points p=(i,j) of image I1 (with the exception of the ones in the external frame of thickness W/2)
%and find the "best" corresponding points in I2 (looking at the search

clc;close all;clear all;
I1=imread('rds_L.jpg');
I2=imread('rds_R.jpg');
w=5;  %window size
dmin=1;
dmax=6;

dmin = -6;
dmax = -1;
I1=rgb2gray(I1);
I2=rgb2gray(I2);
% I1=im2double(I1);
% I2=im2double(I2);
% DLR=comp_dis(I1,I2,w,dmin,dmax)
% figure,imagesc(uint8(DLR)),TITLE('Left to Right Disparity map'),colormap gray
% DRL=comp_dis(I2,I1,w,-dmax,-dmin)
% figure,imagesc(uint8(abs(DRL))),TITLE('Right to Left Disparity map'),colormap gray
[rr,cc]=size(I1);
D=zeros(rr,cc);
wby2=floor(w/2);

%padding is done to keep the index dimensions right.
 for i=wby2:rr-(wby2+1)-dmax-w
     for j=wby2:cc-(w+wby2+1)-dmax-w
          N1=I1(wby2+i:wby2+w+i-1,wby2+1+j:wby2+w+j);
         row=0;
        for j1=j+dmin:j+dmax-1
            N2=I2(wby2+i:wby2+w+i-1,wby2+1+j1+2:wby2+w+j1+2);
            ssdiff=ssd(N1,N2);% calcutate sum of squares of differences
            row=row+1;
            X(row,1)=ssdiff;% stack dmax values into a coulum vactor 
        end
        [~,D(i,j+1)]=max(X);%best similarity is the maximum of ssd.
        %D(i,j+1)=D(i,j+1)+dmin-1;
        
     end
 end
DRL=comp_dis(I2,I1,w,-dmax,-dmin)
figure,imagesc(uint8(abs(DRL))),TITLE('Right to Left Disparity map'),colormap gray