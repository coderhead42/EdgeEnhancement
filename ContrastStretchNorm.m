function [array_out] = ContrastStretchNorm(array_in, low_thr, high_thr)

if nargin ==1, low_thr = 0.01;  end
if nargin <3, high_thr = low_thr; end

abs_max = max(array_in(:));  %Get Global max
abs_min = min(array_in(:));  %Get Global min

if (abs_max == abs_min), array_out = array_in; return; end   % if image is uniform (all zeros, i.e.)


array_in = array_in - abs_min; % remove possible min bias. Now ABS MIN==0
marr = abs_max.*uint8((array_in == 0))+ array_in; % Temporary Move ABS MIN to ABS MAX
next_min = min(marr(:));                 % This is NEXT MIN

marr = uint8((array_in < abs_max)).* array_in; % Temporary Move ABS MAX to ABS MIN
next_max = max(marr(:));                      % This is NEXT MAX
 
imrange = next_max - next_min;     % Range of contrast values
low_thr = low_thr * imrange;       % variation for contrast streching
high_thr = high_thr * imrange;     % variation for contrast streching

low_thr = next_min + low_thr;    %LOW  threshold for contrast streshing
high_thr = next_max - high_thr;  %HIGH threshold for contrast streshing
mask_lo = uint8((array_in < low_thr));
array_in = (mask_lo .*low_thr) + (uint8((~mask_lo)) .* array_in);
 
mask_hi = uint8((array_in > high_thr));
array_in = (mask_hi .*high_thr) + (uint8((~mask_hi)) .* array_in);

array_in = array_in - low_thr; % make 0- global min
array_out = array_in;return; end
