
inputImage = imread('noisy_image.png'); 
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

blurredImage = convn(inputImage, gaussianBlurKernel);


% Display the original and blurred images
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Original Image');

subplot(1, 2, 2);
imshow(blurredImage);
title('Blurred Image');

% Save the blurred image if needed
% imwrite(blurredImage, 'blurred_image.jpg');


%% testing custom conv

blurredImage = conv_2dcolor(inputImage, gaussianBlurKernel);


% Display the original and blurred images
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Original Image');

subplot(1, 2, 2);
imshow(blurredImage);
title('Blurred Image');

% Save the blurred image if needed
% imwrite(blurredImage, 'blurred_image.jpg');
