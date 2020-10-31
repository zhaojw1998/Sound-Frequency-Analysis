%by Jingwei Zhao  517030910047
clc;clear all;close all;
filename1='timedata/';
filename2=[400,800,1200,1600,2000,2400,2800,3200,3600,4000];
frequency_folder = 'frequencydata/';

for dir_idx = 1: length(filename2)
    folder = [filename1, num2str(filename2(dir_idx))];
    save_folder = [frequency_folder, num2str(filename2(dir_idx))];
    if ~exist(save_folder, 'dir')
       mkdir(save_folder)
    end
    files = dir(folder);
    files = files(3: size(files, 1));
    for file_idx = 1: size(files, 1)
        file = files(file_idx).name;
        file_dir = [folder, '/', file];
        struct = load(file_dir);
        sample = struct.sample;
        freq = abs(fft(sample));
        freq = freq(1: size(freq, 1)/2);
        savename = [save_folder, '/', files(file_idx).name];
        save(savename, 'freq');
    end
end
        
    