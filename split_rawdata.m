clc;clear all;close all;
filename1=[400,800,1200,1600,2000,2400,2800,3200,3600,4000];
filename2='raw.mat';
for item = 1: length(filename1)
    prefix = num2str(filename1(item));
    filename=[prefix,filename2];
    struct = load(filename);
    data=struct.data;
    if ~exist(['timedata/', prefix], 'dir')
       mkdir(['timedata/', prefix])
    end
    count = 1;
    for idx = 1: size(data, 1)
        if data(idx) >= 30
            start = idx-128;
            ending = start + 1024 - 1;
            sample = data(start: ending);
            savename=['timedata/', prefix, '/', prefix, '-', num2str(count),'.mat'];
            save(savename, 'sample');
            count= count + 1;
        end
    end
end
