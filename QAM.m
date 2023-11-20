clc;
clear all;
close all;

N=1000;
mlevel=4;
k=log2(mlevel);
x=randi([0 1],N,1);

xysm=bi2de(reshape(x,k,length(x)/k).',"left-msb"); %.' transpose
xmod=qammod(xysm,mlevel); %modulation

SNR_values=0:50;
disp(size(SNR_values));
BER_values=zeros(size(SNR_values));

for i=1:length(SNR_values)
  SNR=SNR_values(i);
  Tx_awgn=awgn(xmod,SNR,"measured");% it adjusts the noise level upto required SNR
  Rx=Tx_awgn;
  Rx_demod=qamdemod(Rx,mlevel);
  z=de2bi(Rx_demod,'left-msb');

  Rx_bitstream=reshape(z.',prod(size(z)),1);

  [number_of_errors,bit_error_rate]=biterr(x,Rx_bitstream);
  BER_values(i)=bit_error_rate;
endfor
semilogy(SNR_values,BER_values,'bo-'); %blue colour circular mark solid line
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER vs. SNR for QAM');