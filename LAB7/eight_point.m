function [F]=eight_point(np,r1_p,r2_p,im1,im2)
% The 8-points algorithm
r1_p=[r1_p,ones(size(r1_p,1),1)];  % Homogenize the points
r2_p=[r2_p,ones(size(r2_p,1),1)];

[newpt_r1, T1] = normalise2dpts(r1_p'); %Normalize the points: using function adopted in lab. 5
[newpt_r2, T2] = normalise2dpts(r2_p');

x=[newpt_r1(1,:)];% X colum vactor
y=[newpt_r1(2,:)];% Y colum vactor

xp=[newpt_r2(1,:)];% X' colum vactor
yp=[newpt_r2(2,:)];% Y' colum vactor

for i=1:np%Write down the matrix A
A(i,:)=[xp(i)*x(i) xp(i)*y(i) xp(i) yp(i)*x(i) yp(i)*y(i) yp(i) x(i) y(i) 1];
end

[U,W,V] = svd(A);
F=V(:,end);% for solution to AF = 0 the last column of the right
% singular vectors
F=reshape(F,3,3)';
% Force the rank of F to be 2: use again the SVD to decompose the matrix, 
% F=UWVT, set W(3,3)=0, recompute the final F: F=UWVT.
[U,W,V] = svd(F);
W(3,3)=0;
F = U*W*V';
newf=T2'*F*T1;% Denormalize F

x=[1:1:size(im1,2)];
figure;imagesc(im2);colormap gray;TITLE('Left Image');
p1=r1_p';
p2=r2_p';


% Dispaly the resulting Epiploar lines with the Corresponding Epipolar 
% Points
 for i=1:size(newpt_r1,2)
     
  l=newf*r1_p(i,:)';
  y=-(l(1)/l(2))*x - l(3)/l(2);
  hold on;
  plot(x,y,'b');
  hold on
  plot(p2(1,i),p2(2,i),'Or','MarkerSize',10);
 end

 figure,imagesc(im1),colormap gray,TITLE('Right Image');
 hold on;
 for i=1:size(newpt_r2,2)
  l=newf'*r2_p(i,:)';
  y=-(l(1)/l(2))*x - l(3)/l(2);
  plot(x,y,'r');
  hold on
  plot(p1(1,i),p1(2,i),'Ob','MarkerSize',10);
 end
 


end