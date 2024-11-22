% Read the image
input_image = imread('pomsky.jpg'); % Replace 'your_image.jpg' with your image file
gray_image = rgb2gray(input_image); % Convert to grayscale if the image is in color

% Display the original image
figure;
imshow(gray_image);
title('Original Image');

% Create Gaussian filter
sigma = 2; % Standard deviation for Gaussian filter
filter_size = 2 * ceil(3 * sigma) + 1; % Filter size (usually 6*sigma rounded up to the nearest odd integer)
gaussian_filter = fspecial('gaussian', filter_size, sigma);

% Apply the Gaussian filter to the image
blurred_image = imfilter(gray_image, gaussian_filter, 'symmetric');

% Display the blurred image
figure;
imshow(blurred_image);
title('Blurred Image');
