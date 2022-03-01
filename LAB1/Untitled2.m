clear all;
A = imread('boccadasse.jpg');

[M N P] = size (A);

[X Y] = meshgrid(1:N,1:M);

%define spatial transform
Xt = X - 50;
Yt = Y - 50;
%define output space
Matrix = zeros(M,N,P);

for i = 1:M
    for j = 1:N
                %compute new (integer) coordinates
                
                xn = round(Xt(i,j));
                yn = round(Yt(i,j));
                
                %check if they are included in the range
                
                if ( (xn > 0) && (xn < N + 1) && (yn > 0) && (yn < M + 1))
                Matrix(yn,xn,:) = A(i,j,:);                      
                end
    end
end

B = uint8(Matrix) ;

figure
image(B);title('Traslation Forward Warping')