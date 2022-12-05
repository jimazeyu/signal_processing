Fs=10000; %采样频率
t=5; %采样时长
% 采集音频
recObj = audiorecorder(Fs,8,1);
disp('Start speaking.')
recordblocking(recObj, 2);
disp('End of Recording.');
% 获取录音数据
myRecording = getaudiodata(recObj);
% 播放声轨
sound(myRecording,Fs);
% 绘制录音数据波形
plot(myRecording);
%存储语音信号
filename = 'wave.wav';
audiowrite(filename,myRecording,Fs);
