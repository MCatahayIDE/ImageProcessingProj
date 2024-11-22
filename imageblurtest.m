inputImage = imread('cute_dog.jpg'); % Replace 'image.jpg' with your image file
inputImage = im2double(inputImage); % Normalize pixel values to the range [0,1]

% Define the 3x3 blur kernel
n = 10;
blurKernel = ones(n, n) / n^2;
sharpenKernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];



blurredImage = convn(inputImage, blurKernel, 'same');



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
