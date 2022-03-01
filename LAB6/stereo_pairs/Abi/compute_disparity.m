%function produces disparity map of I1 w.r.t I2
function D=compute_disparity(I1,I2,W,dmin,dmax)
[p,q]=size(I1);
D=zeros(p,q);
l=W/2+1;
%padding is done to keep the index dimensions right.
for i=l:p-l+1
    for j=l-dmin+1:q-dmax-l
        N1=I1(i-W/2:i+W/2,j-W/2:j+W/2);
        b=0;
        for j1=j+dmin:j+dmax
            N2=I2(i-W/2:i+W/2,j1-W/2:j1+W/2);
            ssd=ssd(N1,N2);
            b=b+1;
            cd(b,1)=ssd;
        end
        %best similarity is the maximum of ssd.
        [~,D(i,j)]=max(cd);
        % The D12 and D21 matrices depend on dmin in the following way.
        % This is how D12 and D21 have same magnitude but different signs at most of the pixels 
        D(i,j)=D(i,j)+dmin-1;
    end
end
end

