clc
clear all
close all

N=1002;
x=randi([0,1],1,N);
M=8;
yy=[];
for i=1:3:length(x)
  if x(i)==0 && x(i+1)==0 & x(i+2)==0
    y=cosd(0)+j*sind(0);
  elseif x(i)==0 && x(i+1)==0 & x(i+2)==1
    y=cosd(45)+j*sind(45);
  elseif x(i)==0 && x(i+1)==1 & x(i+2)==0
    y=cosd(90)+j*sind(90);
  elseif x(i)==0 && x(i+1)==1 & x(i+2)==1
    y=cosd(135)+j*sind(135);
  elseif x(i)==1 && x(i+1)==0 & x(i+2)==0
    y=cosd(180)+j*sind(180);
  elseif x(i)==1 && x(i+1)==0 & x(i+2)==1
    y=cosd(225)+j*sind(225);
  elseif x(i)==1 && x(i+1)==1 & x(i+2)==0
    y=cosd(270)+j*sind(270);
  elseif x(i)==1 && x(i+1)==1 & x(i+2)==1
    y=cosd(315)+j*sind(315);
  endif
  yy=[yy y];
endfor
scatterplot(yy);

EbN0db=20;
EbN0=10^(EbN0db/10);

n=(1/sqrt(2))*[randn(1,length(yy))+j*randn(1,length(yy))];
sigma=sqrt(1/(log2(M)*EbN0));

r=yy+sigma*n;

scatterplot(r);