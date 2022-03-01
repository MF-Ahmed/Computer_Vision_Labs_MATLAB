 function [ux,vy] = MyLucasKanade(img1,img2,N)
  
 C = fspecial('gaussian',5,0.1);% Smooth the images by guassion to 
 img1=conv2(img1,C,'same');     % reduce noise
 img2=conv2(img2,C,'same');
 
 f=[1,-1]; %derivative mask for Row 
 img1_dx = conv2(img1,f);
 img1_dy = conv2(img1,f');  % find gardient along Y-Axis using f' mas~
 
 img2_dx = conv2(img2,f);
 img2_dy = conv2(img2,f');
 
 rr = size(img1,1);
 cc = size(img1,2);
  
 if N==5
    NN = N-3;
   end
 if N==7
     NN = N -4; 
 end
 % start form 3,3 for obtaining 5 X 5 equations for N =5
 % start form 4,4 for obtaining 7 X 7 equations for N =7
   for i=NN+1:rr-NN  
      for j=NN+1:cc-NN
         Qt  = img1(i-2:i+2,j-2:j+2);
         Q_t1 = img2(i-2:i+2,j-2:j+2);
         I_t =  Qt - Q_t1;
         I_t = reshape(I_t,25,1);
         Q_dx = img1_dx(i-2:i+2,j-2:j+2);
         Q_dy = img1_dy(i-2:i+2,j-2:j+2);
         Q_dx = reshape(Q_dx,25,1);
         Q_dy = reshape(Q_dy,25,1);
         A = [Q_dx  Q_dy]';
         b = -I_t;
         %u = (inv(A'*A)*A')'*b;
         u = A'\b;
         ux(i,j)=u(1);
         vy(i,j)=u(2);   
          
      end      
   end 
 
 end