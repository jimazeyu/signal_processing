clc;clear;
% 矩形窗，N=15
b = fir1(15,0.25*pi,'low',boxcar(16));
freqz(b,1,512);
title('矩形窗，N=15')
pause(3);
% 矩形窗，N=33
b = fir1(33,0.25*pi,'low',boxcar(34));
freqz(b,1,512);
title('矩形窗，N=33')
pause(3);

% 汉宁窗，N=15
b = fir1(15,0.25*pi,'low',hanning(16));
freqz(b,1,512);
title('汉宁窗，N=15')
pause(3);
% 汉宁窗，N=33
b = fir1(33,0.25*pi,'low',hanning(34));
freqz(b,1,512);
title('汉宁窗，N=33')
pause(3);

% 汉明窗，N=15
b = fir1(15,0.25*pi,'low',hamming(16));
freqz(b,1,512);
title('汉明窗，N=15')
pause(3);
% 汉明窗，N=33
b = fir1(33,0.25*pi,'low',hamming(34));
freqz(b,1,512);
title('汉明窗，N=33')
pause(3);

% 布莱克曼窗，N=15
b = fir1(15,0.25*pi,'low',blackman(16));
freqz(b,1,512);
title('布莱克曼窗，N=15')
pause(3);
% 布莱克曼窗，N=33
b = fir1(33,0.25*pi,'low',blackman(34));
freqz(b,1,512);
title('布莱克曼窗，N=33')
pause(3);
