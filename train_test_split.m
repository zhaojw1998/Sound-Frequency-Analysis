clc;clear all;close all;
filename1='mfccdata/';
%filename1='frequencydata/';
filename2=[400,800,1200,1600,2000,2400,2800,3200,3600,4000];
X_train = [];
Y_train = [];
X_test = [];
Y_test = [];
for folder_idx = 1: length(filename2)
    folder = [filename1, num2str(filename2(folder_idx))];
    files = dir(folder);
    files = files(3: size(files, 1));
    split_idx = int32(0.8*size(files,1));
    for idx = 1:size(files,1)
        file = load([folder, '/', files(idx).name]);
        freq = file.mfcc_feature;
        %freq = file.mfcc_freq;
        if idx <= split_idx
            X_train = [X_train; freq'];
            Y_train = [Y_train filename2(folder_idx)];
        else
            X_test = [X_test; freq'];
            Y_test = [Y_test filename2(folder_idx)];
        end
    end
end
%for MFCC
mtrainset = [X_train Y_train'];
mtestset = [X_test Y_test'];
size(mtrainset, 1)
size(mtestset, 1)
save('mtrainset.mat', 'mtrainset');
save('mtestset.mat', 'mtestset');
%for FFT
%trainset = [X_train Y_train'];
%testset = [X_test Y_test'];
%size(trainset, 1)
%size(testset, 1)
%save('trainset.mat', 'trainset');
%save('testset.mat', 'testset');