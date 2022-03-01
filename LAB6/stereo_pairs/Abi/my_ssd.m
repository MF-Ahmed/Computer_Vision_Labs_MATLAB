function ssd=my_ssd(N1,N2)
ssd=-sum(sum((N1-N2).^2));
end
