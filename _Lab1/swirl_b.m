
% SWIRL
function [B] = swirl_b(A,theta)
[M N P] = size (A);
% Domain of the input
[X Y]= meshgrid(1:N,1:M);

% center point
         Xc=N/2;
         Yc=M/2;
         pnt=[];
 % Move matrix in the center of rotation               
          X1= X - Xc;
          Y1= Y - Yc;
                  
for i = 1:M
     for j = 1:N
             
        pnt(1)=i;
        pnt(2)=j;
        
        scale = sqrt( ((Xc)^2)+ ((Yc)^2) );
        % Calculate distance between center and point
          dist = sqrt( ((Xc-pnt(1))^2)+ ((Yc-pnt(2))^2) );
        
        % Calculate theta
          theta2=((dist/scale)*theta);
        
        % Calculate the new position ok pixel (rotated of teta degrees)
          Xt(i,j)= X1(i,j)*cos(theta2) - Y1(i,j)*sin(theta2);
          Yt(i,j)= X1(i,j)*sin(theta2) + Y1(i,j)*cos(theta2);
        
  
     end
end

% Bring matrix back into its original position 
 Xt= Xt + Xc;
 Yt= Yt + Yc;


[B]=backward_warping(A,Xt,Yt);


B = uint8(B);
figure
image(B);title('Swirl Backward Warping')
