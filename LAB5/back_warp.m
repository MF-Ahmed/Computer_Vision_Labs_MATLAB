function [I2] = back_warp(I1,H)

[p,q,r]=size(I1);
I2=zeros(p,q,r);
I=zeros(p,q,r);
for i=1:p
    for j=1:q
        A = [j i 1]*pinv(H);
        A = floor(A ./ A(3));
        % Calculating the whole upper and lower number 
        i1=A(2);
        j1=A(1);
        i1f=floor(i1);
        j1f=floor(j1);
         % Calculating distance for the interpolation 
        m=i1-i1f;
        n=j1-j1f;
        % bilinear interpolation
        if(i1f>=1 && i1f<=p-1 && j1f>=1 && j1f<=q-1)
             % Calculate of new pixel value, in general its depends on the
             % 4 neighboring pixels  % neighboring pixels
            X=((1-m)*(1-n)*I1(i1f,j1f,:)+m*(1-n)*I1(i1f+1,j1f,:)+...
                m*n*I1(i1f+1,j1f+1,:)+(1-m)*n*I1(i1f,j1f+1,:));
            
            I2(i,j,:)=floor(X);
        end
    end
end
figure;
imshow(uint8(I2));
title('Homography backward Warping')
end
