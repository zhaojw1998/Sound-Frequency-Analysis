clc;clear all;close all;
filename1='frequencydata/';
filename2=[400,800,1200,1600,2000,2400,2800,3200,3600,4000];
figure(1);
count = 1;
showlist = [1, 2, 5, 10];
%showlist=[1,2,3,4,5,6,7,8,9,10]
for folder_idx = 1: length(filename2)
    if ~ismember(folder_idx, showlist)
        continue
    end      
    folder = [filename1, num2str(filename2(folder_idx))];
    files = dir(folder);
    files = files(3: size(files, 1));
    i = randi(size(files, 1));
    file = load([folder, '/', files(i).name]);
    freq = file.freq;
    x = 1:size(freq, 1);
    x = x/1024*51200;
    %subplot(5, 2, count);
    %plot(x, log(freq));
    plot(x, freq);
    hold on;
    %title(num2str(filename2(folder_idx)))
    count = count + 1;
title('Frequency Plot for Different Tightness')
legend(num2str(filename2((1))),num2str(filename2((2))),num2str(filename2((5))),num2str(filename2((10))))
%legend('400', '800', '1200', '1600', '2000', '2400', '2800', '3200', '3600', '4000')
end
    