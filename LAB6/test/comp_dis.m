function [D]=comp_dis(I1,I2,w,dmin,dmax)
[rr,cc]=size(I1);
D=zeros(rr,cc);
wby2=floor(w/2);

%padding is done to keep the index dimensions right.
 for i=wby2:rr-(wby2+1)-dmax
     for j=wby2:cc-(w+wby2+1)-dmax
          N1=I1(wby2+i:wby2+w+i-1,wby2+1+j:wby2+w+j);
         row=0;
        for j1=j+dmin:j+dmax
            N2=I2(wby2+i:wby2+w+i-1,wby2+1+j1:wby2+w+j1);
            ssdiff=ssd(N1,N2);% calcutate sum of squares of differences
            row=row+1;
            X(row,1)=ssdiff;% stack dmax values into a coulum vactor 
        end
        [~,D(i,j+1)]=max(X);%best similarity is the maximum of ssd.
        %D(i,j+1)=D(i,j+1)+dmin-1;
        
     end
 end
end