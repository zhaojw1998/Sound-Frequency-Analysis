clc;clear all;close all;
%MFCC feature
trainset = load('mtrainset.mat');
testset = load('mtestset.mat');
trainset = trainset.mtrainset;
testset = testset.mtestset;
%FFT eature
%trainset = load('trainset.mat');
%testset = load('testset.mat');
%trainset = trainset.trainset;
%testset = testset.testset;
X_train = trainset(:, 1: size(trainset, 2)-1);
X_train = [ones(size(X_train, 1), 1) X_train];
Y_train = trainset(:, size(trainset, 2));
X_test = testset(:, 1: size(testset, 2)-1);
X_test = [ones(size(X_test, 1), 1) X_test];
Y_test = testset(:, size(testset, 2));
size(X_train)
size(Y_train)
%mdl = fitlm(X_train,Y_train);
mdl = fitlm(X_train,Y_train);
predict = predict(mdl, X_test);
error = predict - Y_test;
sum((predict-Y_test).^2);
plot(error)