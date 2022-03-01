clear all;close all;clc;

fir = imread('yellow_obj1.jpg');
sec = imread('yellow_obj2.jpg');
thr = imread('yellow_obj3.jpg');
fort = imread('yellow_obj4.jpg');
fif = imread('yellow_obj5.jpg');
six = imread('yellow_obj6.jpg');

hsv_1 = rgb2hsv(fir);  %  satrt with First image and so on...
hsv_2 = rgb2hsv(sec);
hsv_3 = rgb2hsv(thr);
hsv_4 = rgb2hsv(fort);
hsv_5 = rgb2hsv(fif);
hsv_6 = rgb2hsv(six);

hsv_img1= hsv_1(:,:,1);
hsv_img2= hsv_2(:,:,1);
hsv_img3= hsv_3(:,:,1);
hsv_img4= hsv_4(:,:,1);
hsv_img5= hsv_5(:,:,1);
hsv_img6= hsv_6(:,:,1);

% figure;subplot(236) 
% subplot(231),imshow(hsv_img1),colormap HSV,title('image1')%as intensity
% subplot(232),imshow(hsv_img2),colormap HSV,title('image2')%as intensity
% subplot(233),imshow(hsv_img3),colormap HSV,title('image3')%as intensity
% subplot(234),imshow(hsv_img4),colormap HSV,title('image4')%as intensity
% subplot(235),imshow(hsv_img5),colormap HSV,title('image5')%as intensity
% subplot(236),imshow(hsv_img6),colormap HSV,title('image6')%as intensity


figure;
imagesc(hsv_img1);

[x,y] = ginput(2);  % Select Two points in Yellow cube.

x=round(x);  % Get integer values
y=round(y);

p1=[x(1) y(1)];
p2=[x(2) y(2)];

rrp=p2(1)-p1(1);
ccp=p2(2)-p1(2);

for i=1:rrp     % calculate Area of Selected points
    for j=1:ccp    
        data_set(i,j)= hsv_img1(p1(1)+i,p1(2)+j);
    end
    
end
  
  [rr,cc]=size(hsv_img1);
  m = mean(data_set);
  sd = std(m); 
  maxthresh= m + (3*sd);
  minthresh= m - (3*sd);
  
seg_image1 = color_seg(hsv_img1,minthresh,maxthresh);  % Pass arguments to 
seg_image2 = color_seg(hsv_img2,minthresh,maxthresh);  % color_seg function 
seg_image3 = color_seg(hsv_img3,minthresh,maxthresh);  % which applies threshold
seg_image4 = color_seg(hsv_img4,minthresh,maxthresh);  % and gives segmented binary 
seg_image5 = color_seg(hsv_img5,minthresh,maxthresh);  % image
seg_image6 = color_seg(hsv_img6,minthresh,maxthresh);


figure;subplot(236) 
subplot(231),imshow(seg_image1),colormap gray,title('image1')%as intensity
subplot(232),imshow(seg_image2),colormap gray,title('image2')%as intensity
subplot(233),imshow(seg_image3),colormap gray,title('image3')%as intensity
subplot(234),imshow(seg_image4),colormap gray,title('image4')%as intensity
subplot(235),imshow(seg_image5),colormap gray,title('image5')%as intensity
subplot(236),imshow(seg_image6),colormap gray,title('image6')%as intensity
% 
