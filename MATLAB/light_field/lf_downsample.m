function LR_LF = lf_downsample(HR_LF,mf)
% This function is used to downsample the light field using a scale 1/mf
% and then rescale it using bicubic interpolation.

% Initialize the low-resolution light field
LR_LF = zeros(size(HR_LF),'uint8');

for u = 1:size(HR_LF,4)
    for v = 1:size(HR_LF,4)
        % Get the current view
        I = HR_LF(:,:,:,u,v);
        % Downsample I by a scale 1/mf
        I = imresize(I,1/mf);
        % Rescale I using bicubic interpolation
        LR_LF(:,:,:,u,v) = imresize(I,[size(HR_LF,1),size(HR_LF,2)]);
    end
end