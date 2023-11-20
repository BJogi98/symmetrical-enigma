clc;
clear all;
close all;

sym = input("Enter symbols: ");
freq = input("Enter frequencies: ");

prob = freq/sum(freq);

dict = shannonfanodict(sym,prob);

H = 0;
for i = 1:length(sym)
    H = H + (-prob(i)*log2(prob(i)));
endfor

disp("\nEntropy: ");
disp(H);

L = 0;
for i = 1:length(sym);
    L = L + prob(i)*length(dict{i});
end

disp("\nLength: ");
disp(L);

eff = (H/L)*100;
disp("\nEfficiency: ");
disp(eff);