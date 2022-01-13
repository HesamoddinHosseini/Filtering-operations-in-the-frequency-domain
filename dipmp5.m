

 کدمربوط به مرحله ۱و ۲)
close all;
clear;
%read images
Im421 = imread('Im421.jpg');
Im421 = rgb2gray(Im421);
 
Im421_zp = padarray(Im421, [22 22]);
[Im421_zp_row_size, Im421_zp_col_size] = size(Im421_zp);
 
figure;
subplot(2,2,1);
imshow(Im421_zp); 
title('Original Image');
 
Im421_zp = im2double(Im421_zp);
 
Im421_fft = fft2(Im421_zp);
Im421_fft_shift = fftshift(Im421_fft);
 
subplot(2,2,2);
imshow(abs(log(1 + Im421_fft_shift)),[]); 
title('Frequency Image');
 
x = 1:Im421_zp_col_size;
y = 1:Im421_zp_row_size;
x = x - Im421_zp_col_size/2;
y = y - Im421_zp_row_size/2;
 
[X ,Y] = meshgrid(x , y);
 
v = 0.1;
 
Gaussian_Filter = exp(-(X.^2+Y.^2)/2*v^2) / 2 * pi * v^2;
 
subplot(2,2,3);
mesh(X,Y,Gaussian_Filter);
 
Im421_fft_shift_smooth = Im421_fft_shift .* Gaussian_Filter;
 
Im421_smooth = ifft2(ifftshift(Im421_fft_shift_smooth));
 
subplot(2,2,4);
imshow(Im421_smooth, []); 
title('fft Blur Image');

img = imread('Im421.jpg');
img = rgb2gray(img);
 
for i = 1:10
 
    v = 0.02 * i;
    GaussianFilter(img, v);
end
 
%======================================
 clear;
%read images
Im421 = imread('Im422.jpg');
Im421 = rgb2gray(Im421);
 
Im421_zp = padarray(Im421, [22 22]);
[Im421_zp_row_size, Im421_zp_col_size] = size(Im421_zp);
 
figure;
subplot(2,2,1);
imshow(Im421_zp); 
title('Original Image');
 
Im421_zp = im2double(Im421_zp);
 
Im421_fft = fft2(Im421_zp);
Im421_fft_shift = fftshift(Im421_fft);
 
subplot(2,2,2);
imshow(abs(log(1 + Im421_fft_shift)),[]); 
title('Frequency Image');
 
x = 1:Im421_zp_col_size;
y = 1:Im421_zp_row_size;
x = x - Im421_zp_col_size/2;
y = y - Im421_zp_row_size/2;
 
[X ,Y] = meshgrid(x , y);
 
v = 0.1;
 
Gaussian_Filter = exp(-(X.^2+Y.^2)/2*v^2) / 2 * pi * v^2;
 
subplot(2,2,3);
mesh(X,Y,Gaussian_Filter);
 
Im421_fft_shift_smooth = Im421_fft_shift .* Gaussian_Filter;
 
Im421_smooth = ifft2(ifftshift(Im421_fft_shift_smooth));
 
subplot(2,2,4);
imshow(Im421_smooth, []); 
title('fft Blur Image');
%----------------------------------------------------------------
 
img = imread('Im422.jpg');
img = rgb2gray(img);
 
for i = 1:10
 
    v = 0.02 * i;
    GaussianFilter(img, v);
end
 
%======================================
 
clear;
%read images
Im421 = imread('Im423.jpg');
Im421 = rgb2gray(Im421);
 
Im421_zp = padarray(Im421, [22 22]);
[Im421_zp_row_size, Im421_zp_col_size] = size(Im421_zp);
 
figure;
subplot(2,2,1);
imshow(Im421_zp); 
title('Original Image');
 
Im421_zp = im2double(Im421_zp);
 
Im421_fft = fft2(Im421_zp);
Im421_fft_shift = fftshift(Im421_fft);
 
subplot(2,2,2);
imshow(abs(log(1 + Im421_fft_shift)),[]); 
title('Frequency Image');
 
x = 1:Im421_zp_col_size;
y = 1:Im421_zp_row_size;
x = x - Im421_zp_col_size/2;
y = y - Im421_zp_row_size/2;
 
[X ,Y] = meshgrid(x , y);
 
v = 0.1;
 
Gaussian_Filter = exp(-(X.^2+Y.^2)/2*v^2) / 2 * pi * v^2;
 
subplot(2,2,3);
mesh(X,Y,Gaussian_Filter);
 
Im421_fft_shift_smooth = Im421_fft_shift .* Gaussian_Filter;
 
Im421_smooth = ifft2(ifftshift(Im421_fft_shift_smooth));
 
subplot(2,2,4);
imshow(Im421_smooth, []); 
title('fft Blur Image');
%----------------------------------------------------------------
 
img = imread('Im423.jpg');
img = rgb2gray(img);
 
for i = 1:10
 
    v = 0.02 * i;
    GaussianFilter(img, v);
end
کد مربوط به مرحله۳)

scales = linspace(1/8,1,50);
scales = scales(50:-1:1);
 
Im421 = imread('Im421.jpg');
Im421 = rgb2gray(Im421);
[Im421_row_size, Im421_col_size] = size(Im421);
 
cntr = 1;
 
for i = scales
    small_img = zeros(floor(Im421_row_size * i), floor(Im421_col_size * i));
    
    [small_img_row_size, small_img_col_size] = size(small_img);
    
    for row = 1:small_img_row_size
        for col = 1:small_img_col_size
            
            original_img_row = round(row / i);
            original_img_col = round(col / i);
            
            small_img(row, col) = Im421(original_img_row, original_img_col);
            
        end
    end
    small_img = uint8(small_img);
    filename = strcat('Im421-',num2str(cntr),'.jpg');
    imwrite(small_img, filename);
    
    cntr = cntr + 1;
end
 
Im421 = imread('Im422.jpg');
Im421 = rgb2gray(Im421);
[Im421_row_size, Im421_col_size] = size(Im421);
 
cntr = 1;
 
for i = scales
    small_img = zeros(floor(Im421_row_size * i), floor(Im421_col_size * i));
    
    [small_img_row_size, small_img_col_size] = size(small_img);
    
    for row = 1:small_img_row_size
        for col = 1:small_img_col_size
            
            original_img_row = round(row / i);
            original_img_col = round(col / i);
            
            small_img(row, col) = Im421(original_img_row, original_img_col);
            
        end
    end
    small_img = uint8(small_img);
    filename = strcat('Im422-',num2str(cntr),'.jpg');
    imwrite(small_img, filename);
    
    cntr = cntr + 1;
end
 
Im421 = imread('Im423.jpg');
Im421 = rgb2gray(Im421);
[Im421_row_size, Im421_col_size] = size(Im421);
 
cntr = 1;
 
for i = scales
    small_img = zeros(floor(Im421_row_size * i), floor(Im421_col_size * i));
    
    [small_img_row_size, small_img_col_size] = size(small_img);
    
    for row = 1:small_img_row_size
        for col = 1:small_img_col_size
            
            original_img_row = round(row / i);
            original_img_col = round(col / i);
            
            small_img(row, col) = Im421(original_img_row, original_img_col);
            
        end
    end
    small_img = uint8(small_img);
    filename = strcat('Im423-',num2str(cntr),'.jpg');
    imwrite(small_img, filename);
    
    cntr = cntr + 1;
end
 

کد مربوط به مرحله ۴)
clc
 clear all
Hossein = imread('Hossein.jpg');
Hossein = rgb2gray(Hossein);
Hesam = imread('Hesam.jpg');
Hesam = rgb2gray(Hesam);

[img_row_size, img_col_size] = size(Hesam);
 
figure;
subplot(2,3,1);
imshow(Hesam); 
title('Hesam Image');
 
subplot(2,3,2);
imshow(Hossein); 
title('Hossein Image');
 
Hesam_fft_shift = fftshift(fft2(Hesam));
Hossein_fft_shift = fftshift(fft2(Hossein));
 
x = 1:img_col_size;
y = 1:img_row_size;
x = x - img_col_size/2;
y = y - img_row_size/2;
 
[X ,Y] = meshgrid(x , y);
 
variance = 0.1;
 
Gaussian_Filter_low_pass = exp(-(X.^2+Y.^2)/2*variance^2) / 2 * pi * variance^2;
Gaussian_Filter_high_pass = 1 - exp(-(X.^2+Y.^2)/2*variance^2) / 2 * pi * variance^2;
 
subplot(2,3,4);
imshow(Gaussian_Filter_low_pass, []); 
title('low pass');
 
subplot(2,3,5);
imshow(Gaussian_Filter_high_pass, []); 
title('high pass');
 
img_low_pass = Hesam_fft_shift .* Gaussian_Filter_low_pass;
img_high_pass = Hossein_fft_shift .* Gaussian_Filter_high_pass;
 
result_ftt_img = img_low_pass * 0.99 + img_high_pass * 0.01;
 
result_img = ifft2(ifftshift(result_ftt_img));
 
result_img = real(result_img);
result_img = mat2gray(result_img, [min(result_img(:)) max(result_img(:))]);
 
subplot(2,3,3);
imshow(result_img); 
title('result img');
 
imwrite(result_img,'Hesam1.jpg');


