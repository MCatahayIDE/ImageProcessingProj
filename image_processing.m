
inputImage = imread('cute_dog.png'); 
inputImage = im2double(inputImage); % Normalize pixel values to the range [0,1]

% types of blur kernels

% blurKernel, averages n x n area of pixels
n = 3;
meanBlurKernel = ones(n, n) / n^2;

sharpenKernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Gaussian filter
sigma = 3; % Standard deviation for Gaussian filter
filter_size = 2 * ceil(3 * sigma) + 1; % Filter size (usually 6*sigma rounded up to the nearest odd integer)
gaussianBlurKernel = fspecial('gaussian', filter_size, sigma);

blurredImage = convn(inputImage, sharpenKernel);


% Display the original and blurred images
figure;
subplot(2, 1, 1);
imshow(inputImage);
title('Original Image');

subplot(2, 1, 2);
imshow(blurredImage);
title('Output Image');

% Save the image if needed
% imwrite(outputImage, 'output_image.jpg');


%% testing custom conv

blurredImage = conv_2dcolor(inputImage, sharpenKernel);


% Display the original and blurred images
figure;
subplot(2, 1, 1);
imshow(inputImage);

title('Original Image');

subplot(2, 1, 2);
imshow(blurredImage);
title('Output Image');

% Save the image if needed
% imwrite(outputImage, 'output_image.jpg');
