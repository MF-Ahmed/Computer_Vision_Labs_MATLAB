% ROTATION
function [B] = rotation_b(A,theta)

[M N P] = size (A);

% Domain of the input
[X Y] = meshgrid(1:N,1:M);
    
% Center point
       
         Xc=N/2;
         Yc=M/2;
         
% Move matrix in the center of rotation         
         X1 = X - Xc;
         Y1 = Y - Yc;
          
% Calculate the new position of pixel 
for i = 1:N
    for j = 1:M
          Xt(j,i) = X1(j,i)*cos(theta) - Y1(j,i)*sin(theta);
          Yt(j,i) = X1(j,i)*sin(theta) + Y1(j,i)*cos(theta);
    end
end
% Bring matrix back into its original position 
Xt= Xt + Xc;
Yt= Yt + Yc;

[B]=backward_warping(A,Xt,Yt);


B = uint8(B);
figure
image(B);title('Rotation Backward Warping')
%---------------------------------------------------------
