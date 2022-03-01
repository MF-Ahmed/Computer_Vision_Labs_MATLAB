%Back warping function
%  A := Input image
%  Xt and Yt := new domain.

function [Mat] = backward_warping(A,Xt,Yt)
[M N P] = size (A);
%initialize the new array (image of output)
Mat = zeros(M,N,P);

for i = 1:M
    for j = 1:N
        % Save the new coordinates
        x=Xt(i,j);
        y=Yt(i,j);
        % Calculating the whole upper and lower number 
        xinf=floor(x);
        xsup=xinf+1;
        yinf=floor(y);
        ysup=yinf+1;
        % Calculating distance for the interpolation 
        a=(x-xinf);
        b=(y-yinf);
                
        %check that the new coordinates are consistent
        if ( ysup<((M)) && (yinf>0) && (xsup<(N)) && (xinf>0))
            % Calculate of new pixel value, in general its depends on the 4 neighboring pixels                    % neighboring pixels
            Mat(i,j,:)= (1-a)*(1-b)*A(yinf,xinf,:)+a*(1-b)*A(ysup,xinf,:)+a*b*A(ysup,xsup,:)+(1-a)*b*A(yinf,xsup,:);      
        end
    end    
end