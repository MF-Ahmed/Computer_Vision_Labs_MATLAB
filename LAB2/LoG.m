% function to compute kernal of laplacion of gaussion for 
% a given standard deviation  

function L = LoG(sig,spatial) % input standard deviation mormally 2


[X Y] = meshgrid(-spatial:spatial); % create row arrays and colum arrays corresponding 
                        % to -k and +k

% laplacian of gaussion  
% got formula form wikipedia


 L = -(1/pi*sig^4)*(1- (X.^2 + Y.^2)./(2*sig^2)).*(exp(- (X.^2 + Y.^2)./(2*sig^2))); 
       % Calculate Log

imagesc(L),colormap gray;
 colorbar,title('LoG Graph');

end




