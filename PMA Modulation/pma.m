clear
N = 10^5; % number of symbols
alpha4pam = [-3 -1 1 3]; % 4-PAM alphabets
Es_N0_dB = [-3:20]; % multiple Eb/N0 values
ipHat = zeros(1,N);
for ii = 1:length(Es_N0_dB)
ip = randsrc(1,N,alpha4pam);
s = (1/sqrt(5))*ip; % normalization of energy to 1
n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)]; % white guassian noise, 0dB variance

y = s + 10^(-Es_N0_dB(ii)/20)*n; % additive white gaussian noise

% demodulation
r = real(y); % taking only the real part

ipHat(find(r< -2/sqrt(5))) = -3;
ipHat(find(r>= 2/sqrt(5))) = 3;
ipHat(find(r>=-2/sqrt(5) & r<0)) = -1;
ipHat(find(r>=0 & r<2/sqrt(5))) = 1;

nErr(ii) = size(find([ip- ipHat]),2); % couting the number of errors
end

simBer = nErr/N;
theoryBer = 0.75*erfc(sqrt(0.2*(10.^(Es_N0_dB/10))));
close all
figure
semilogy(Es_N0_dB,theoryBer,'b.-');
hold on
semilogy(Es_N0_dB,simBer,'mx-');
axis([-3 20 10^-5 1])
grid on
legend('theory', 'simulation');
xlabel('Es/No, dB')
ylabel('Symbol Error Rate')
title('Symbol error probability curve for 4-PAM modulation')