clc;clear all;close all;
filename1='timedata/';
filename2=[400,800,1200,1600,2000,2400,2800,3200,3600,4000];
frequency_folder = 'mfccdata/';

for dir_idx = 1: length(filename2)
    folder = [filename1, num2str(filename2(dir_idx))];
    save_folder = [frequency_folder, num2str(filename2(dir_idx))];
    if ~exist(save_folder, 'dir')
       mkdir(save_folder)
    end
    files = dir(folder);
    files = files(3: size(files, 1));
    count = 0;
    for file_idx = 1: size(files, 1)
        file = files(file_idx).name;
        file_dir = [folder, '/', file];
        struct = load(file_dir);
        sample = struct.sample;
        %sample
        %count
        feature = mfcc(sample, 51200, 'WindowLength', 64, 'OverlapLength', 32);
        mfcc_feature = reshape(feature, size(feature, 1)* size(feature, 2), 1);
        savename = [save_folder, '/', files(file_idx).name];
        save(savename, 'mfcc_feature');
        count = count+1;
    end
end
        
    