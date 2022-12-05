clear;clc;
%读取信号
[origin_signal,fs] = audioread('wave.wav');  %读取音频文件,pyr为信号，fs为采样频率
t = length(origin_signal)/fs; %计算音频长度
sample_points=[1/fs:1/fs:t]; %计算采样点横坐标
freq_signal=fft(origin_signal); %计算频谱信号
freq_signal=fftshift(freq_signal); %频谱搬迁

%加入单频噪声
cos_fs=4000; %余弦信号频率
cos_noise=0.01*cos(2*pi*cos_fs*sample_points);%添加振幅0.01余弦信号
cos_noise=cos_noise';
signal_with_cos_noise=origin_signal+cos_noise; %叠加噪声
freq_signal_cos=fft(signal_with_cos_noise); %计算频谱信号
freq_signal_cos=fftshift(freq_signal_cos); %频谱搬迁

%加入高斯白噪声
[signal_with_gauss_noise,noise]=noisegen(origin_signal,20); %添加十比一信噪比的高斯白噪声
freq_signal_gauss=fft(signal_with_gauss_noise); %计算频谱
freq_signal_gauss=fftshift(freq_signal_gauss); %频谱搬迁
%绘制原始信号时域波形
subplot(211);
title('Time domain')
xlabel('Time/s');
ylabel('Amplitude');
plot(sample_points,origin_signal,'b'); 
hold on;
plot(sample_points,signal_with_cos_noise,'g'); 
hold on;
plot(sample_points,signal_with_gauss_noise,'r'); 
hold on;
%绘制原始信号时域波形
subplot(212);
title('Frequency domain')
xlabel('Frequency/Hz');
ylabel('Amplitude');
plot([-fs/2:1/t:fs/2-1/t],abs(freq_signal),'b'); 
hold on;
plot([-fs/2:1/t:fs/2-1/t],abs(freq_signal_cos),'g'); 
hold on;
plot([-fs/2:1/t:fs/2-1/t],abs(freq_signal_gauss),'r'); 
hold on;
