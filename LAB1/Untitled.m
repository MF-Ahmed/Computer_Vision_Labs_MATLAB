clear all;
a=imread('flower.jpg');
imshow(a)
[p q r]=size(a);
c=zeros(size(a));
%% translation by a factor u on x-axis and v on y-axis
u=100;
v=100;
for i=1:p
    for j=1:q
      i1=i+u;
      j1=j+v;
      b(i1,j1,:)=a(i,j,:);
    end
end

figure;imshow (b)