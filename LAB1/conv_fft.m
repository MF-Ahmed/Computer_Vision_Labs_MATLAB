%
%signal
w=101;
a=zeros(1,w);
a(ceil(w/2)+(-5:5))=1;
figure,plot(a),axis([1,w,-1,2])
b=a;
%convolution
c=conv(a,b); c=c(ceil(length(c)/2)+ (-floor(w/2):floor(w/2)));
figure,plot(c),axis([1,w,-1,12])
%FFT
A=fftshift(fft(a));
B=fftshift(fft(b));
%comparison
figure,plot(abs(A)),axis([1,w,-1,12])
figure,plot(abs(A.*B)),axis([1,w,-1,140])
hold on,plot(abs(fftshift(fft(c))),'r--'),axis([1,w,-1,140])
