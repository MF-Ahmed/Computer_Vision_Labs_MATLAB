%Forward warping function
%  A := Input image
%  Xt and Yt := new domain.

function [Mat] = forward_warping(A,Xt,Yt)


[M N P] = size (A);
%initialize the new array (image of output)
Mat = zeros(M,N,P);

for i = 1:M
    for j = 1:N
                %take the new coordinates
                newx=round(Xt(i,j));
                newy=round(Yt(i,j));
                %check that the new coordinates are consistent
                if ( (newy<M+1) && (newy>0) && (newx<N+1) && (newx>0))
                Mat(newy,newx,:)= A(i,j,:);                      % : because is for all the 3 channels
                end
    end
end