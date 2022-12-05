clear;clc;
%读取信号
[origin_signal,fs] = audioread('wave.wav');  %读取音频文件,pyr为信号，fs为采样频率
t = length(origin_signal)/fs; %计算音频长度
sample_points=[1/fs:1/fs:t]; %计算采样点横坐标
%加入单频噪声
cos_fs=4000; %余弦信号频率
cos_noise=0.01*cos(2*pi*cos_fs*sample_points);%添加振幅0.01余弦信号
cos_noise=cos_noise';
signal_with_cos_noise=origin_signal+cos_noise; %叠加噪声
sound(signal_with_cos_noise,fs); %播放，有刺耳蜂鸣
freq_signal=fft(signal_with_cos_noise); %计算频谱信号
freq_signal=fftshift(freq_signal); %频谱搬迁
%绘制信号时域波形
subplot(211);
plot(sample_points,signal_with_cos_noise); 
title('Time domain')
xlabel('Time/s');
ylabel('Amplitude');
%绘制信号时域波形
subplot(212);
plot([-fs/2:1/t:fs/2-1/t],abs(freq_signal)); 
title('Frequency domain')
xlabel('Frequency/Hz');
ylabel('Amplitude');
