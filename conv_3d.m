function result = conv_3d(input, kernel, updateInterval)
    % Custom implementation of the convn function using loops
    % input: The input array (can be 2D or 3D)
    % kernel: The convolution kernel (must be smaller than the input)
    
    % Get the sizes of input and kernel
    [input_rows, input_cols, input_depth] = size(input);
    [kernel_rows, kernel_cols, kernel_depth] = size(kernel);
    
    % Compute the size of the output
    output_rows = input_rows + kernel_rows - 1;
    output_cols = input_cols + kernel_cols - 1;
    output_depth = 3;
    
    % Initialize the result array with zeros
    result = zeros(output_rows, output_cols, output_depth);
    
    % Pad the input array with zeros to handle edge cases
    pad_size = [floor(kernel_rows/2), floor(kernel_cols/2), 0];
    padded_input = padarray(input, pad_size, 0, 'both');

    % Perform convolution using nested loops
        
    if updateInterval == 0
        for i = 1:(output_rows - kernel_rows)
            for j = 1:(output_cols - kernel_cols)
                for d = 1:output_depth
                    % Extract the region of interest
                    roi = padded_input(i:i+kernel_rows-1, j:j+kernel_cols-1,  min(d, input_depth));

                    % Perform element-wise multiplication and summation
                    result(i, j, d) = sum(sum(roi .* kernel(:, :, min(d, kernel_depth))));

                end
            end
        end
    else
        % Set up figure for real-time visualization
        figure;
        hImage = imshow(result, []);
        title('Convolution in Progress');
        pause on;
        
        for i = 1:(output_rows - kernel_rows)
            for j = 1:(output_cols - kernel_cols)
                for d = 1:output_depth
                    % Extract the region of interest
                    roi = padded_input(i:i+kernel_rows-1, j:j+kernel_cols-1,  min(d, input_depth));

                    % Perform element-wise multiplication and summation
                    result(i, j, d) = sum(sum(roi .* kernel(:, :, min(d, kernel_depth))));
                    if mod(i+j, 450) == 0
                        set(hImage, 'CData', result);
                        pause(updateInterval);
                    end
                end
            end
        end
    end
end