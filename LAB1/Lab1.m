a=imread('flower.jpg');
imshow(a)
[p q r]=size(a);
c=zeros(size(a));
%% translation by a factor u on x-axis and v on y-axis
u=50;
v=60;
for i=1:p
    for j=1:q
      i1=i+u;
      j1=j+v;
      b(i1,j1,:)=a(i,j,:);
    end
end
figure; imshow(b)
     
%% Transformation- forward warping
z=45;
ic=round(i/2);
jc=round(j/2);
P=[1 0 ic; 0 1 jc;0 0 1];
R=[cosd(z), sind(z) 0; -sind(z), cosd(z) 0; 0 0 1];
Pinv=[1 0 -ic; 0 1 -jc;0 0 1];
T=P*R*Pinv;
for i=1:p
    for j=1:q
        A=T*[i;j;1];
        i1=round(A(1));
        j1=round(A(2));
        if(i1>=1&&i1<=p&&j1>=1&&j1<=q)
            X=a(i,j,:);
      c(i1,j1,:)=floor(X);
        end
    end
end
figure; imshow(c)

%% backward warping

%rotation angle
z=45;
d=uint8(zeros(size(a)));
%translation values
u=0;
v=0;
ic=round(p/2);
jc=round(q/2);
P=[1 0 ic; 0 1 jc;0 0 1];
R=[cosd(z), sind(z), u;-sind(z), cosd(z), v;0 0 1];
Pinv=[1 0 -ic;0 1 -jc;0 0 1];
T=P*R*Pinv;
for i=1:p
    for j=1:q
        A=T\[i;j;1];
        i1=A(1);
        j1=A(2);
       i1f=floor(i1);
       j1f=floor(j1);
        m=i1-i1f;
        n=j1-j1f;
        % bilinear interpolation
        if(i1f>=1 && i1f<=p-1 && j1f>=1 && j1f<=q-1)
                X=((1-m)*(1-n)*a(i1f,j1f,:)+m*(1-n)*a(i1f+1,j1f,:)+...
                m*n*a(i1f+1,j1f+1,:)+(1-m)*n*a(i1f,j1f+1,:));
     
          d(i,j,:)=floor(X);  
        end
    end
end

figure,imagesc(200,300,d);

    