function [B] = traslation_f(A,h,k)

[M N P] = size (A);

% Domain of the input
[X Y]= meshgrid(1:N,1:M);

Xt=X-h;
Yt=Y-k;

[B]=forward_warping(A,Xt,Yt);

A = uint8(A);
B = uint8(B);

figure
axis equal
image(B);title('Traslation Forward Warping')
end