%% initialization
I1=imread('rds_L.jpg');
I2=imread('rds_R.jpg');
W=2;
dmin=1;
dmax=6;
I1=rgb2gray(I1);
I2=rgb2gray(I2);
I1=im2double(I1);
I2=im2double(I2);
D12=compute_disparity(I1,I2,W,dmin,dmax);
imagesc(uint8(D12)),axis image, colormap gray

%% D12=compute_disparity(I1,I2,W,[dmin,dmax]);
D21=compute_disparity(I2,I1,W,-dmax,-dmin);
figure,imagesc(uint8(abs(D21))),axis image, colormap gray


%% Calculating the consistency
D=left_right_consistency(D12,D21);
figure,imagesc(uint8(D)),axis image, colormap gray
