clc;
clear;
%% 参数确定
Wp=0.1*pi; %通带截至频率
Ws=0.4*pi; %阻带截止频率
ap=1; %通带最大衰减
as=25; %阻带最大衰减
fs=1; %采样频率

%% 脉冲响应不变法+3dB通带截止频率
wp=Wp*fs;
ws=Ws*fs;
N=buttord(wp,ws,ap,as,'s');
wc=wp/(10^(0.1*ap)-1)^(1/2/N);
[b,a]=butter(N,wc,'s');
[c,d]=impinvar(b,a,fs);
w=linspace(0,pi,512);
h=freqz(c,d,w);
% 绘制幅度响应
subplot(2,2,1)
plot(w/pi,20*log10(abs(h)));
title('脉冲响应不变法+3dB通带截止频率')
grid;
w=[wp ws];
h=freqz(c,d,w);
% 输出参数
fprintf('脉冲响应不变法+3dB通带截止频率\n');
fprintf('ap=%.4f\t',-20*log10(abs(h(1))));
fprintf('as=%.4f\n',-20*log10(abs(h(2))));
fprintf('N= %.4f\t',N);
fprintf('wc=%.4f\n',wc);

%% 脉冲响应不变法+3dB阻带截止频率
wp=Wp*fs;
ws=Ws*fs;
N=buttord(wp,ws,ap,as,'s');
wc=ws/(10^(0.1*as)-1)^(1/2/N);
[b,a]=butter(N,wc,'s');
[c,d]=impinvar(b,a,fs);
w=linspace(0,pi,512);
h=freqz(c,d,w);
% 绘制幅度响应
subplot(2,2,2)
plot(w/pi,20*log10(abs(h)));
title('脉冲响应不变法+3dB阻带截止频率')
grid;
w=[wp ws];
h=freqz(c,d,w);
% 输出参数
fprintf('脉冲响应不变法+3dB阻带截止频率\n');
fprintf('ap=%.4f\t',-20*log10(abs(h(1))));
fprintf('as=%.4f\n',-20*log10(abs(h(2))));
fprintf('N= %.4f\t',N);
fprintf('wc=%.4f\n',wc);

%% 双线性变换法+3dB通带截止频率
wp=2*fs*tan(Wp/2);
ws=2*fs*tan(Ws/2);
N=buttord(wp,ws,ap,as,'s');
wc=wp/(10^(0.1*ap)-1)^(1/2/N);
[b,a]=butter(N,wc,'s');
[c,d]=bilinear(b,a,fs);
w=linspace(0,pi,512);
h=freqz(c,d,w);
% 绘制幅度响应
subplot(2,2,3)
plot(w/pi,20*log10(abs(h)));
title('双线性变换法+3dB通带截止频率')
grid;
w=[wp ws];
h=freqz(c,d,w);
% 输出参数
fprintf('双线性变换法+3dB通带截止频率\n');
fprintf('ap=%.4f\t',-20*log10(abs(h(1))));
fprintf('as=%.4f\n',-20*log10(abs(h(2))));
fprintf('N= %.4f\t',N);
fprintf('wc=%.4f\n',wc);

%% 双线性变换法+3dB阻带截止频率
wp=2*fs*tan(Wp/2);
ws=2*fs*tan(Ws/2);
N=buttord(wp,ws,ap,as,'s');
wc=ws/(10^(0.1*as)-1)^(1/2/N);
[b,a]=butter(N,wc,'s');
[c,d]=bilinear(b,a,fs);
w=linspace(0,pi,512);
h=freqz(c,d,w);
% 绘制幅度响应
subplot(2,2,4)
plot(w/pi,20*log10(abs(h)));
title('双线性变换法+3dB阻带截止频率')
grid;
w=[wp ws];
h=freqz(c,d,w);
% 输出参数
fprintf('双线性变换法+3dB阻带截止频率\n');
fprintf('ap=%.4f\t',-20*log10(abs(h(1))));
fprintf('as=%.4f\n',-20*log10(abs(h(2))));
fprintf('N= %.4f\t',N);
fprintf('wc=%.4f\n',wc);
