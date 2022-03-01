function [I2] = forward_warp(I1,H)

[rr,cc,depth]=size(I1);
I2=zeros(rr,cc,depth);
I=zeros(rr,cc,depth);
% forward warping
for row=1:rr
    for col=1:cc
coords = [col row 1]*H;
coords = floor(coords ./ coords(3));
new_row = coords(2);
new_col=coords(1);

if (new_row >=1 && new_row <= rr &&  new_col >= 1 && new_col <= cc )
         I2(new_row,new_col,:)=I1(row,col,:);
end
    end
end

figure;
imshow(uint8(I2));
title('My homography Forwad Warping')


end