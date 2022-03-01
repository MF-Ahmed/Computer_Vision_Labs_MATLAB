%The function will visit all points p=(i,j) of image I1 (with the exception of the ones in the external frame of thickness W/2)
%and find the "best" corresponding points in I2 (looking at the search
function [D]=compute_disp(I1,I2,w,dmin,dmax)
[rr,cc]=size(I1);
D=zeros(rr,cc);
padd=w/2+1;
%padding is done to keep the index dimensions right.
for i=padd:rr-padd+1
    for j=padd-dmin+1:cc-dmax-padd
        N1=I1(i-w/2:i+w/2,j-w/2:j+w/2);
        row=0;
        for j1=j+dmin:j+dmax
            N2=I2(i-w/2:i+w/2,j1-w/2:j1+w/2);
            ssdiff=ssd(N1,N2);% calcutate sum of squares of differences
            row=row+1;
            X(row,1)=ssdiff;% stack dmax values into a coulum vactor 
        end
        [~,D(i,j)]=max(X);%best similarity is the maximum of ssd.
        D(i,j)=D(i,j)+dmin-1;
    end
end
end

