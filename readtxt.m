clc;clear all;close all;
filename2=[400,800,1200,1600,2000,2400,2800,3200,3600,4000];
filename1='acquisitionData-';
filename3='.txt';

for ind=1:length(filename2)
    ind
    filename=[filename1,num2str(filename2(ind)),filename3];
    fid=fopen(filename,'r');
    
    lines = 0;
    while ~feof(fid)
        fgetl(fid);
        lines = lines +1;
    end
    fclose(fid);
    tic
    fid=fopen(filename,'r');
    data=double(zeros(lines,1));
    i=1;
    while ~feof(fid)
        str = fgetl(fid);   % ��ȡһ��, str���ַ���
        %    s=regexp(str,'\s+');   % �ҳ�str�еĿո�, �Կո���Ϊ�ָ����ݵ��ַ�
        data(i)=str2double(str);    %�ҳ���������, ��Ϊ���������ж�����
        i=i+1;
        %temp=str2num(str(s(20):s(21)));  %�ҳ�ĳ������, ��Ϊ���������ж�����
    end
    plot(data);%hold on;
    matname=[num2str(filename2(ind)),'raw.mat'];
    save(matname,'data');
    toc
    
end

