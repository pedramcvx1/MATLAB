This same as that of fm but only the change is we use pmmod instead of fmmod.

CODE:

close all;
clear all;
t=0:10*10^(-6):0.001;
fm1=10^(3);
x=2*sin(2*pi*fm1*t);
fc=20*10^(6);
fs=100*10^(6);
dph=pi/2;
ini_phase=0;
y=pmmod(x,fc,fs,dph,ini_phase); %phase modulation
subplot(1,2,1);
plot(x);
title(‘message signal’);
subplot(1,2,2);
plot(y);
title(‘phase modulation’);
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
%This is a program to do Phase Modulation of a signal
% see also DSBAM, SSBAM
clear all
close all
clc


td = input('\nEnter the total Signal Duration\n\n  ->');
ts = input('\nEnter the sampling time for this signal and it should be less than 1\n\n  ->');
fc = input('\nEnter the carrier frequency\n\n  ->');
k = input('\nEnter the Phase modulation constant\n\n  ->');
t = 0:ts:td;
t2 = int64( (t/ts) +1 );
wc = 2*pi*fc;
m(t2) = input('\nEnter the msg signal as a function of time "t" \n\n  ->');
n = input('\nEnter the SNR of the AWGN for no noise enter inf\n\n  ->');
s = cos((2*pi*fc*t)+ k*m(t2));
subplot(2,1,1),plot(t,s);
title('Phase Modulated Signal');
xlabel('Time');
ylabel('Transmitted Signal at the Modulator');

sn = awgn(s,n);
subplot(2,1,2),plot(t,sn);
title('Phase Modulated Signal with AWGN');
xlabel('Time');
ylabel('Received Signal at the Demodulator');
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
The code illustrates how frequency and phase modulation can be achieved in matlab-

% Frequency and Phase modulation

clear all
clc

t =0:0.01:10;

Am = input('Enter Message signal Amplitude(Am) = ');
fm = input('Enter Message signal frequency(fm)=');
Wm =2*pi*fm;

m = Am*cos(Wm*t);

subplot(2,2,1);
plot(t,m);
hold on
title('Message Input Signal');
xlabel('Time --->');
ylabel('Amplitude --->')

Ac = input('Enter Carrier Signal Amplitude(Ac) = ');
fc = input('Enter Carrier Signal Frequency(fc)=');
Wc= 2*pi*fc;

c = Ac*cos(Wc*t);

subplot(2,2,2);
plot(t,c);
hold on
title('Carrier Signal');
xlabel('Time --->');
ylabel('Amplitude --->')

kf = input('Frequency Sensitivity(kf) = ');

s_fm = Ac*cos(Wc*t+2*pi*kf*cumsum(m));

subplot(2,2,3);
plot(t,s_fm);
hold on
title('Frequency Modulated Signal');
xlabel('Time --->');
ylabel('Amplitude --->')

kp = input('Phase Sensitivity = ');

s_pm = Ac*cos(Wc*t+m.*kp );

subplot(2,2,4);
plot(t,s_pm);
title('Phase Modulated Signal');
xlabel('Time --->');
ylabel('Amplitude --->')
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
