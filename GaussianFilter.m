function Smooth_img = GaussianFilter(img, variance)

img = im2double(img);
[img_row_size, img_col_size] = size(img);

figure;
subplot(2,3,1);
imshow(img); 
title('Original Image');

img_fft = fft2(img);
img_fft_shift = fftshift(img_fft);

subplot(2,3,3);
imshow(abs(log(1 + img_fft_shift)), []); 
title('fft Image');

x = 1:img_col_size;
y = 1:img_row_size;
x = x - img_col_size/2;
y = y - img_row_size/2;

[X ,Y] = meshgrid(x , y);

Gaussian_Filter = exp(-(X.^2+Y.^2)/2*variance^2) / 2 * pi * variance^2;

subplot(2,3,2);
imshow(Gaussian_Filter, []); 
title('Gaussian Filter');

img_fft_shift_smooth = img_fft_shift .* Gaussian_Filter;

difference_ftt_img = img_fft_shift - img_fft_shift_smooth;

subplot(2,3,6);
imshow(abs(log(1 + difference_ftt_img)), []); 
title('Difference fft Image');

Smooth_img = ifft2(ifftshift(img_fft_shift_smooth));

subplot(2,3,4);
imshow(Smooth_img, []); 
title('Smooth Image');

img = uint8(img);
Smooth_img = uint8(Smooth_img);
difference_img = img - Smooth_img;

subplot(2,3,5);
imshow(difference_img, []); 
title('Difference Image');
end