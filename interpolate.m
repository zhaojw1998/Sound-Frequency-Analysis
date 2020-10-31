clc;clear all;close all;
%Change me
masked_label = 2400;
new_resolution = 100;
%read data
filename1='frequencydata/';
filename2=[400,800,1200,1600,2000,2400,2800,3200,3600,4000];
k = find(filename2 == masked_label);
filename2(k) = [];
MatchTable = zeros(9, 512);
for dir_idx = 1: length(filename2)
    folder = [filename1, num2str(filename2(dir_idx))];
    files = dir(folder);
    files = files(3: size(files, 1));
    sum = zeros(512, 1);
    for file_idx = 1: size(files, 1)
        file = files(file_idx).name;
        file_dir = [folder, '/', file];
        struct = load(file_dir);
        frequency = struct.freq;
        sum = sum + frequency;
    end
    sum = sum / size(files, 1);
    MatchTable(dir_idx, :) = sum';
end
%interpolate
new_axis = 400: new_resolution: 4000;
MatchTableInrerpolated = interp1(filename2, MatchTable, new_axis, 'cubic');
voteBand = zeros(size(new_axis, 2), 1);
%inference
folder = [filename1, num2str(masked_label)];
files = dir(folder);
files = files(3: size(files, 1));
for file_idx = 1: size(files, 1)
    file = files(file_idx).name;
    file_dir = [folder, '/', file];
    struct = load(file_dir);
    frequency = struct.freq;
    for idx =1:size(frequency, 1)
        for bin = 1: size(voteBand, 1)
            if abs(frequency(idx) - MatchTableInrerpolated(bin, idx)) < new_resolution/2
                voteBand(bin) = voteBand(bin) + 1;
            end
        end
    end 
    [argvalue, argmax] = max(voteBand);
    (argmax-1) * new_resolution + 400;
end



