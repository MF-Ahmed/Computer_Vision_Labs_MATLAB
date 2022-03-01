
% we compute row and column  intensity change to find edges of given
%image using LoG Karnel

clear all;
close all;
clc;

img=imread('boccadasse.jpg');
img1=img(:,:,1);

img2=imread('cameraman.tif');
img3=imread('car.bmp');

spatial=4;
s=1.5;
z=LoG(s,spatial);


X1=conv2(img1,z,'simple');
figure;imagesc(img);colormap gray;
title('Orignal Image');

X2=conv2(img2,z,'simple');
figure;imagesc(img2);colormap gray;
title('Orignal Image');

X3=conv2(img3,z,'simple');
figure;imagesc(img3);colormap gray;
title('Orignal Image');


%%%%%%%%%%%%%%%%%  for our first image  %%%%%%%%%%%%%%%%%%%%

[rr,cc]=size(X1);

thresh=0;  % thresh hold value increase or decrease for depth of edge

row_edge = zeros(rr,cc);  % matrix for rows zero crossings conatiner
col_edge = zeros(rr,cc);  % matrix for Colums zero crossings conatiner
imag_edge = zeros(rr,cc); % matrix for row + Colums zero crossings conatiner


for i=1:rr   % we scan along each row form 1 to rr and each column upto cc-1
    for j=1:cc-1 % 
        if((X1(i,j) * X1(i,j+1))<=0 && (sqrt(X1(i,j).^2 + X1(i,j+1).^2)) >= thresh ) 
            row_edge(i,j)=1;
        end
    end
end
figure;
imagesc(row_edge);colormap gray;

title('Zero crossing detection accross the Rows of Image')

for j=1:cc %we scan along each colum form 1 to cc and each row upto rr-1
    for i=1:rr-1 
        if((X1(i,j) * X1(i+1,j)) <=0 && (sqrt(X1(i,j).^2 + X1(i+1,j).^2)) >= thresh ) 
            col_edge(i,j)=1;
        end
    end
end
figure;
imagesc(col_edge);colormap gray;

title('Zero crossing detection accross the colums of Image')

imag_edge = row_edge + col_edge; %we add both row and colum zero crossing

figure;
imagesc(imag_edge);colormap gray;

title('Zero crossing detection accross the Rows+ colums of Image')


%%%%%%%%%%%%%%%%%  for our 2nd image  %%%%%%%%%%%%%%%%%%%%

[rr2,cc2]=size(X2);



row_edge2 = zeros(rr2,cc2);  % matrix for rows zero crossings conatiner
col_edge2 = zeros(rr2,cc2);  % matrix for Colums zero crossings conatiner
imag_edge2 = zeros(rr2,cc2); % matrix for row + Colums zero crossings conatiner


for i=1:rr2   % we scan along each row form 1 to rr and each column upto cc-1
    for j=1:cc2-1 % 
        if((X2(i,j) * X2(i,j+1))<=0 && (sqrt(X2(i,j).^2 + X2(i,j+1).^2)) >= thresh ) 
            row_edge2(i,j)=1;
        end
    end
end
figure;
imagesc(row_edge2);colormap gray;

title('Zero crossing detection accross the Rows of Image')

for j=1:cc2 %we scan along each colum form 1 to cc and each row upto rr-1
    for i=1:rr2-1 
        if((X2(i,j) * X2(i+1,j)) <=0 && (sqrt(X1(i,j).^2 + X2(i+1,j).^2)) >= thresh ) 
            col_edge2(i,j)=1;
        end
    end
end
figure;
imagesc(col_edge2);colormap gray;

title('Zero crossing detection accross the colums of Image')

imag_edge2 = row_edge2 + col_edge2; %we add both row and colum zero crossing

figure;
imagesc(imag_edge2);colormap gray;

title('Zero crossing detection accross the Rows+ colums of Image')


%%%%%%%%%%%%%%%%%  for our 3rd image  %%%%%%%%%%%%%%%%%%%%

[rr3,cc3]=size(X3);



row_edge3 = zeros(rr3,cc3);  % matrix for rows zero crossings conatiner
col_edge3 = zeros(rr3,cc3);  % matrix for Colums zero crossings conatiner
imag_edge3 = zeros(rr3,cc3); % matrix for row + Colums zero crossings conatiner


for i=1:rr3   % we scan along each row form 1 to rr and each column upto cc-1
    for j=1:cc3-1 % 
        if((X3(i,j) * X3(i,j+1))<=0 && (sqrt(X3(i,j).^2 + X3(i,j+1).^2)) >= thresh ) 
            row_edge3(i,j)=1;
        end
    end
end
figure;
imagesc(row_edge3);colormap gray;

title('Zero crossing detection accross the Rows of Image')

for j=1:cc3 %we scan along each colum form 1 to cc and each row upto rr-1
    for i=1:rr3-1 
        if((X3(i,j) * X3(i+1,j)) <=0 && (sqrt(X3(i,j).^2 + X3(i+1,j).^2)) >= thresh ) 
            col_edge3(i,j)=1;
        end
    end
end
figure;
imagesc(col_edge3);colormap gray;

title('Zero crossing detection accross the colums of Image')

imag_edge3 = row_edge3 + col_edge3; %we add both row and colum zero crossing

figure;
imagesc(imag_edge3);colormap gray;

title('Zero crossing detection accross the Rows+ colums of Image')
