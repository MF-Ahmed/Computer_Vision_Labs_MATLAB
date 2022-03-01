
% Forward Warping and Translation
clear all;
%img = imread('boccadasse.jpg'); %load image into matrix img
load sample_image;
figure,image(img),title('Orignal image');
[rr cc zz] = size (img);     % save rows, colums and Z axis 

[X Y] = meshgrid(1:cc,1:rr);  

%define spatial transform
Xt = X + 50;   % translate X axis by factor 50
Yt = Y + 60;   % translate X axis by factor 60
%define output space
Matrix = zeros(rr,cc,zz);

for i = 1:rr
    for j = 1:cc
                %compute new (integer) coordinatesa
                % forward warping and Translation
                
                xn = round(Xt(i,j));   % round off to get integer values
                yn = round(Yt(i,j));
                
                %check if they are included in the range
                if ( (xn <= cc ) && (yn <= rr))                
                Matrix(yn,xn,:) =img(i,j,:); % perform forward warping
                end
                
    end
end

tran = uint8(Matrix) ;
figure,image(tran),title('Translated image forward warping');


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Rotation Forward Warping
clear all;
load sample_image;
[rr cc zz] = size (img);     % save rows, colums and Z axis 
[X Y] = meshgrid(1:cc,1:rr);

theta=-45;  %rotation angle
Matrix = zeros(rr,cc,zz);
% Center point
         Xc=(rr/2);
         Yc=(cc/2);         
% Move matrix in the center of rotation         
         X1 = X - Xc;
         Y1 = Y - Yc;
          
% Calculate the new position of pixel 
for i = 1:cc
    for j = 1:rr
          Xt(j,i) = X1(j,i)*cos(theta) - Y1(j,i)*sin(theta);      
          Yt(j,i) = X1(j,i)*sin(theta) + Y1(j,i)*cos(theta);
          
    end
end
% Bring matrix back into its original position 
Xt= Xt + Xc;
Yt= Yt + Yc;

for i = 1:rr
    for j = 1:cc
                %compute new (integer) coordinatesa
                % forward warping and Translation
                xn = round(Xt(i,j));   % round off to get integer values
                yn = round(Yt(i,j));
                
                %check if they are included in the range
                if ( (xn < cc+1 ) &&(xn>0)&&(yn>0)&& (yn <= rr+1))                
                Matrix(yn,xn,:) = img(i,j,:); % perform forward warping
                end
                
    end
end

tran = uint8(Matrix) ;
figure,image(tran),title('rotated image forward warping');

%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Rotation Backward Warping
 clear all;
load sample_image;
[rr cc zz] = size (img);     % save rows, colums and Z axis 
[X Y] = meshgrid(1:cc,1:rr);
theta=45;
Matrix = zeros(rr,cc,zz);
% Center point
         Xc=(rr/2);
         Yc=(cc/2);         
% Move matrix in the center of rotation         
         X1 = X - Xc;
         Y1 = Y - Yc;
          
% Calculate the new position of pixel 
for i = 1:cc
    for j = 1:rr
          Xt(j,i) = X1(j,i)*cos(theta) - Y1(j,i)*sin(theta);      
          Yt(j,i) = X1(j,i)*sin(theta) + Y1(j,i)*cos(theta);
          
    end
end
% Bring matrix back into its original position 
Xt= Xt + Xc;
Yt= Yt + Yc;

for i = 1:rr
    for j = 1:cc
        % Save the new coordinates
        x=Xt(i,j);
        y=Yt(i,j);
        % Calculating the whole upper and lower number 
        xinf=floor(x);
        xsup=xinf+1;
        yinf=floor(y);
        ysup=yinf+1;
        % Calculating distance for the interpolation 
        a=(x-xinf);
        b=(y-yinf);
                
        %check that the new coordinates are consistent
        if ( ysup<((rr)) && (yinf>0) && (xsup<(cc)) && (xinf>0))
            % Calculate of new pixel value, in general its depends on the 4 neighboring pixels  % neighboring pixels
            Matrix(i,j,:)= (1-a)*(1-b)*img(yinf,xinf,:)+a*(1-b)*img(ysup,xinf,:)+a*b*img(ysup,xsup,:)+(1-a)*b*img(yinf,xsup,:);

        end
    end    
end

tran = uint8(Matrix) ;
figure,image(tran),title('rotated image Backward warping');