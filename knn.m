clc;clear all;close all;
%MFCC feature
trainset = load('mtrainset.mat');
testset = load('mtestset.mat');
trainset = trainset.mtrainset;
testset = testset.mtestset;
%FFT feature
%trainset = load('trainset.mat');
%testset = load('testset.mat');
%trainset = trainset.trainset;
%testset = testset.testset;

X_train = trainset(:, 1: size(trainset, 2)-1);
Y_train = trainset(:, size(trainset, 2));
X_test = testset(:, 1: size(testset, 2)-1);
Y_test = testset(:, size(testset, 2));

Mdl = fitcknn(X_train,Y_train,'NumNeighbors',10,'Standardize',1, 'Distance', 'euclidean')
predict = predict(Mdl,X_test);
comp = (predict == Y_test);
sum(comp)/size(comp, 1)