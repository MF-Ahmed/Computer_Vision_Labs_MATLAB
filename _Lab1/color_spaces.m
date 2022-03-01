

%Color spaces
color=imread('color.bmp');
figure;
image(color);title('Color');
colorHSV=rgb2hsv(color);
%RGB
figure;
subplot(2,2,1);
imagesc(color);title('Color');

subplot(2,2,2);
imagesc(color(:,:,1));title('Red');

subplot(2,2,3);
imagesc(color(:,:,2));title('Green');

subplot(2,2,4)
imagesc(color(:,:,3));title('Blue');

%HSV
figure;
subplot(2,2,1);
imagesc(color(:,:,1));title('Color');

subplot(2,2,2);
imagesc(colorHSV(:,:,1));title('Hue');

subplot(2,2,3);
imagesc(colorHSV(:,:,2));title('Saturation');

subplot(2,2,4)
imagesc(colorHSV(:,:,3));title('Value');

%Set the saturation to 0.5
colorHSV(:,:,2)=0.5; 
figure;
image(hsv2rgb(colorHSV));title('Saturation=0.5');
%Set the saturation to 0 and the value to 0.7
colorHSV(:,:,2)=0.0;
colorHSV(:,:,3)=0.7;
figure;
image(hsv2rgb(colorHSV));title('Saturation=0, Value=0.7');

%test image: Flower
flower=imread('flower.jpg');
flowerHSV=rgb2hsv(flower);
%RGB
figure;
subplot(2,2,1);
imagesc(flower);title('Flower');

subplot(2,2,2);
imagesc(flower(:,:,1));title('Red');

subplot(2,2,3);
imagesc(flower(:,:,2));title('Green');

subplot(2,2,4)
imagesc(flower(:,:,3));title('Blue');

%HSV
figure;
subplot(2,2,1);
imagesc(flower);title('Flower');

subplot(2,2,2);
imagesc(flowerHSV(:,:,1));title('Hue');

subplot(2,2,3);
imagesc(flowerHSV(:,:,2));title('Saturation');

subplot(2,2,4)
imagesc(flowerHSV(:,:,3));title('Value');

%test image: boccadasse2
boccadasse2=imread('boccadasse2.jpg');
boccadasse2HSV=rgb2hsv(boccadasse2);
%RGB
figure;
subplot(2,2,1);
imagesc(boccadasse2);title('Boccadasse2');

subplot(2,2,2);
imagesc(boccadasse2(:,:,1));title('Red');

subplot(2,2,3);
imagesc(boccadasse2(:,:,2));title('Green');

subplot(2,2,4)
imagesc(boccadasse2(:,:,3));title('Blue');

%HSV
figure;
subplot(2,2,1);
imagesc(boccadasse2);title('Boccadasse2');

subplot(2,2,2);
imagesc(boccadasse2HSV(:,:,1));title('Hue');

subplot(2,2,3);
imagesc(boccadasse2HSV(:,:,2));title('Saturation');

subplot(2,2,4)
imagesc(boccadasse2HSV(:,:,3));title('Value');
