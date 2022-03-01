%function to calculate the left and right consistencey of the two disparity
%maps
function D=left_right_consistency(D12,D21)
D=D12+D21;
end
