clc;close all;clear all;

 N = 5;  % we select Q for 5X5 neighbor hood initially
 %N = 7; % or we can select 7X7 neighbor hood 

                                                %%%%%%%%%  For Sphere  %%%%%%%%%%%
 
 files = dir('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\sphere\*.ppm');  % the folder in which ur images exists
 no_files = length(files);
 
  for i = 1 : no_files/2  % for first 10 files only
     image1 = strcat('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\sphere\',files(i).name);
     img1 = imread(image1);
     img1 = img1(:,:,1);
     image2 = strcat('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\sphere\',files(i+1).name);
     img2 = imread(image2);
     img2 = img2(:,:,1);
     [u,v]=MyLucasKanade(img1,img2,N);
     figure;
     quiver(u,v);
  end
%                                                %%%%%%%%  For Sunflower/Tree %%%%%%%% 
                                               %%% uncomment the code below  
 
%  files = dir('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\sflowg\*.ppm');  % the folder in which ur images exists
%  no_files = length(files);
%  
%   for i = 1 :no_files/6   % for 1st 10 files only
%      image1 = strcat('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\sflowg\',files(i).name);
%      img1 = imread(image1);
%      img1 = img1(:,:,1);
%      image2 = strcat('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\sflowg\',files(i+1).name);
%      img2 = imread(image2);
%      img2 = img2(:,:,1);
%      [U,V]=MyLucasKanade(img1,img2,N);
%      figure;
%      quiver(U,V);
% %        Uf=flipud(U), Vf=flipud(V);
% %        figure;
% %        quiver(Uf(1:10:size(Uf,1), 1:10:size(Uf,2)),Vf(1:10:size(Vf,1),1:10:size(Vf,2))); % For sub sapmling 
%   end
  

                                            %%%%%%%%  For Video Surveillance  %%%%%%%%%%% 
                                            %%% uncomment the code below 
                                            
%  files = dir('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\videosurveillance\*.jpg');  % the folder in which ur images exists
%  no_files = length(files);
%  
%   for i = 1 :4%no_files/7.2   % for 1st 10 files only
%      image1 = strcat('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\videosurveillance\',files(i).name);
%      img1 = imread(image1);
%      img1 = img1(:,:,1);
%      image2 = strcat('C:\Users\Ahmed\Desktop\All EMARO_Class\1st Semester\computer Vision\LAB_four\videosurveillance\',files(i+1).name);
%      img2 = imread(image2);
%      img2 = img2(:,:,1);
%      [U,V]=MyLucasKanade(img1,img2,N);
%      figure;
%      Uf=flipud(U), Vf=flipud(V);
%      %quiver(Uf,Vf);
%      quiver(Uf(1:10:size(Uf,1), 1:10:size(Uf,2)),Vf(1:10:size(Vf,1), 1:10:size(Vf,2))); % For sub sapmling 
%   end
%