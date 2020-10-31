MATLAB Data
    trainset.mat: 由FTT提取的频谱特征（训练集）；
    testset.mat: 由FTT提取的频谱特征（测试集）；
    mtrainset.mat: 由MFCC提取的频谱特征（训练集）；
    mtestset.met: 由MFCC提取的频谱特征（测试集）。
MATLAB Code
    knn.m: K近邻分类代码，在前面MATLAB Data存在时可直接运行；
    Linear_regression: 线性回归代码，在前面MATLAB Data存在时可直接运行；
    readtxt.m: 读取txt文件转化为.mat；
    split_rawdata.m: 将readtxt.m得到的raw data分离为单个声信号样本，并按所属松紧度组织文件结构，结果存放于文件夹timedata中；
    extract_frequency.m: 提取timedata中各数据的FFT特征，存放在文件夹freqeuncydata中；
    plot_frequency.m: 画不同松紧度下声信号样本的频谱对比图；
    extract_mfcc.m: 提取timedata中各数据的MFCC特征，存放在文件夹mfccdata中；
    train_test_split.m: 将MFCC或FFT特征拼接为一个矩阵，并按8：2划分训练集和测试集，生成的文件即为MATLAB Data中所列的.mat文件；
    interpolate.m: 对松紧度插值，并基于投票法来确定某以频率特征所对应的松紧度。运行该代码前应先运行split_raw.m和extract_frequency.m。