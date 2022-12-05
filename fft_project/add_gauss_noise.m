clear;clc;
%读取信号
[origin_signal,fs] = audioread('wave.wav');  %读取音频文件,pyr为信号，fs为采样频率
t = length(origin_signal)/fs; %计算音频长度
sample_points=[1/fs:1/fs:t]; %计算采样点横坐标
%加入高斯白噪声
[signal_with_gauss_noise,noise]=noisegen(origin_signal,10); %添加十比一信噪比的高斯白噪声
sound(signal_with_gauss_noise,fs); %播放，声音嘈杂
freq_signal=fft(signal_with_gauss_noise); %计算频谱信号
freq_signal=fftshift(freq_signal); %频谱搬迁
%绘制信号时域波形
subplot(211);
plot(sample_points,signal_with_gauss_noise); 
title('Time domain')
xlabel('Time/s');
ylabel('Amplitude');
%绘制信号时域波形
subplot(212);
plot([-fs/2:1/t:fs/2-1/t],abs(freq_signal)); 
title('Frequency domain')
xlabel('Frequency/Hz');
ylabel('Amplitude');
