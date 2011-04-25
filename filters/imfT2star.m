function data = imfT2star(data, pulse, refpulse)% anaT2star(files, last, pulse, refpulse)cut = 10; % ignore data points before this one.nsamp = size(data, 3);if nargin < 2 || isempty(pulse)    pulse = 1:size(data, 1);endif nargin < 3 || isempty(refpulse)    refpulse = pulse(1);endif length(refpulse) == 1    refpulse = repmat(refpulse, size(pulse));endif ndims(data) == 3    if ~any(isnan(refpulse))        data =  mean(mean(data(pulse, cut:end, :), 3), 2) ...            -  mean(mean(data(refpulse, cut:end, :), 3), 2);    else        data =  mean(mean(data(pulse, cut:end, :), 3), 2);    endelse    if ~any(isnan(refpulse))        data =  mean(data(:, pulse), 1)' - mean(data(:, refpulse), 1)';    else        data = mean(data(:, pulse), 1)';    endend
