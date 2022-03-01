function ssdiff = ssd(N1,N2)

ssdiff =-sum(sum((N1-N2).^2));

end