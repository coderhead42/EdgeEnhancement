function [out_image] = EdgeEnhancer(I, alpha)
B = fspecial('gaussian', [4,4]);
U = fspecial('unsharp');
%A = [0, 0, 0; 0, 1, 0; 0, 0, 0];

%BlurImage = imfilter(I, B);
Q = ContrastStretchNorm(I, alpha, alpha);
Final = imfilter(Q, U);


%K = wiener2(Final,[2 2]);
out_image = Final;
end
