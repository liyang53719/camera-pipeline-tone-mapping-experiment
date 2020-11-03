close all;
clear all;

tone_curve = dlmread('Tone2_dng.txt');
inv_tone_curve = dlmread('inv_tone_for_dng.txt');
grossberg_tone_curve = dlmread('grossberg_tone_curve.txt');
inv_of_grossberg_tone_curve = dlmread('inv_of_grosberg.txt');
asd = linspace(0,1,1025);
figure(1), plot(linspace(0,1,1025), tone_curve);
figure(2), plot(linspace(0,1,1025), inv_tone_curve);
figure(3), plot(linspace(0,1,1025), grossberg_tone_curve);
figure(4), plot(linspace(0,1,1025), inv_of_grossberg_tone_curve);

img_NikonD40_0029 = imread('input_image\NikonD40_0029.NEF');
img_NIKOND40_0029 = imread('input_image\NIKOND40_0029.dng');

img = img_NikonD40_0029;
% img = img_NIKOND40_0029;

for k=1:4
    switch k
        case 1
            ton_lut = tone_curve;
        case 2
            ton_lut = inv_tone_curve;
        case 3
            ton_lut = grossberg_tone_curve;
        case 4
            ton_lut = inv_of_grossberg_tone_curve;            
    end

for i=1:size(img,1)
    for j=1:size(img,2)
        tong(i,j,1:3) = uint8(255*ton_lut(int16(double(img(i,j,:))*1024/255)+1));
    end
end

figure(5)
subplot(4,3,1+3*(k-1))
plot(linspace(0,1,1025), ton_lut);
subplot(4,3,2+3*(k-1))
imshow(img)
subplot(4,3,3+3*(k-1))
imshow(tong)

end


