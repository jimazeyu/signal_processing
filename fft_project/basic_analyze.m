clear;clc;
%读取信号
[origin_signal,fs] = audioread('wave.wav');  %读取音频文件,pyr为信号，fs为采样频率
t = length(origin_signal)/fs; %计算音频长度
sample_points=[1/fs:1/fs:t]; %计算采样点横坐标
freq_signal=fft(origin_signal); %计算频谱信号
freq_signal=fftshift(freq_signal); %频谱搬迁
%绘制原始信号时域波形
subplot(211);
plot(sample_points,origin_signal); 
title('Time domain')
xlabel('Time/s');
ylabel('Amplitude');
%绘制原始信号时域波形
subplot(212);
plot([-fs:1:fs-1]/2,abs(freq_signal)); 
title('Frequency domain')
xlabel('Frequency/Hz');
ylabel('Amplitude');
