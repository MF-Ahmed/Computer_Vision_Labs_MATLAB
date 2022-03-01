 
function seg_img = color_seg(imag,minthresh,maxthresh)

  [rr,cc]=size(imag);
  seg_img=zeros(rr,cc);
    
    for i =1:rr
        for j=1:cc
            if( (imag(i,j,1)> minthresh) & (imag(i,j,1)< maxthresh) )
              seg_img(i,j)= 1;
            
            end
                
            end
    end
    
    
end