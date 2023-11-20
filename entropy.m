clc;
clear all;
close all;

n = input("Enter no. of symbols: ");
q = input("Enter channel matrix P(Y/X): ");
disp(q);
p = input("Enter source probabilities: ");  % Probabilities for source

N = 1:n;
px = diag(p, n, n);
disp("\nP(X): ");
disp(px);

pxy = px*q; %P(X,Y) = P(X)*P(Y/X)
disp("\nP(X,Y): ");
disp(pxy);

py = p*q;   % Probabilities for destination
disp("\nP(Y): ");
disp(py);

Hx = 0;
for i = 1:n
    Hx = Hx + (-p(i)*log2(p(i)));
end

Hy = 0
for i = 1:n
    Hy = Hy + (-py(i)*log2(py(i)));
end;

disp("\nEntropy of source: ");
disp(Hx);

disp("\nEntropy of destination: ");
disp(Hy);

Hxy = 0;    %H(x,y)
for i = 1:n
    for j = 1:n
        Hxy = Hxy + (-pxy(i,j)*log2(pxy(i,j)));
    end
end

disp("\nMutual Entropy: ");
disp(Hxy);

disp("\nConditional Entropy H(y/x): ");
disp(Hxy - Hy);

disp("\nConditional Entropy H(x/y): ");
disp(Hxy - Hx);

disp("\nMutual Information I(x,y): ");
disp(Hx + Hy - Hxy);

if(Hxy - Hy == 0)
    disp("\nThis channel is a lossless channel");
end
if(Hx + Hy - Hxy == 0)
    disp("\nThis channel is useless");
end
if(Hx == Hy)
    if(Hxy - Hx == 0)
        disp("\nThis channel is noiseless channel");
    end
end
        