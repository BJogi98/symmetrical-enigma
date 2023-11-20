clc;
clear all;
close all;

n = input("Enter no. of code bits: ");
k = input("Enter no. of msg bits: ");
p = input("Enter parity matrix: ");

disp("\nParity Matrix: ");
disp(p);

I = eye(k);
G = [I,p];

disp("\nGenerator Matrix: ");
disp(G);

m = dec2bin(0:1:2^k -1);
disp("\nMessage words: ");
disp(m);

C = m*G;

for i = 1:2^k
    for j = 1:n
        C(i,j) = mod(C(i,j),2);
    end
end

disp("\nCodewords: ");
disp(C);

weight = sum(C');
disp("\nHamming weight of codes: ");
disp(weight);

disp("\nParity check matrix: ");
H = [p',eye(n-k)];
disp(H);

disp("\nTranspose of parity check matrix: ");
disp(H');

weight(1,1) = weight(1,2);
d = min(weight);
disp("\nMinimum weight: ");
disp(d);

E = eye([n,n]);
r = input("Enter received codeword: ");
s = r*H';

for i = 1:n-k
    s(1,i) = mod(s(1,i),2);
end


disp("\nSyndrome: ");
disp(s);


if s == [0 0 0]
    disp("Valid codeword");
end

h = H';
err = -1;
for i = 1:n
    if s == h(i,:)
        err = i;
        disp("\nError in ");
        disp(i);
        break;
    end
end
    
disp("\nError pattern: ");
disp(E(err,:));

c = mod(r+E(err,:), 2);
disp("\nCorrected codeword: ");
disp(c);
    