
inputImage = imread('noisy_image.png'); 
inputImage = im2double(inputImage); % Normalize pixel values to the range [0,1]

%% ~~~~~~~~~~~~~~~~~~~~~Types of blur kernels~~~~~~~~~~~~~~~~~~~~~%%

% mean blur, averages n x n area of pixels
n = 10;
meanBlurKernel = ones(n, n) / n^2;

% sharpen, like high pass filter
sharpenKernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Gaussian filter
sigma = 5; % Standard deviation for Gaussian filter
filter_size = 2 * ceil(3 * sigma) + 1; % Filter size 
gaussianBlurKernel = fspecial('gaussian', filter_size, sigma);

% Motion blur, can choose blur size and angle of blur
motionBlurKernel = fspecial("motion",50,45);


%%
% latexCode = latex(sym(meanBlurKernel));
% 
% figure;
% axes('Visible', 'off'); % Create invisible axes to avoid clutter.
% text(0.5, 0.5, ['$' latexCode '$'], 'Interpreter', 'latex', ...
%     'FontSize', 14, 'HorizontalAlignment', 'center');


%%
%% ~~~~~~~~~~~~~~~~~~~~~Custom conv~~~~~~~~~~~~~~~~~~~~~%%

outputImage = conv_2dcolor(inputImage, meanBlurKernel, 0);


% Display the original and blurred images
figure;
subplot(2, 1, 1);
imshow(inputImage);

title('Original Image');

subplot(2, 1, 2);
imshow(outputImage);
title('Output Image');

% imwrite(outputImage, 'motion_dog_image.jpg'); % to save image