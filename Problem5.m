% problem 5
k=15;

x_k = funcX(k);

%
X = dct(x_k);

% n = 1
X_hat_1 = replaceLast(X,1);
% n = 2
X_hat_2 = replaceLast(X,2);
% n = 3
X_hat_3 = replaceLast(X,3);
% n = 4
X_hat_4 = replaceLast(X,4);
% n = 5
X_hat_5 = replaceLast(X,5);
% n = 6
X_hat_6 = replaceLast(X,6);
% n = 7
X_hat_7 = replaceLast(X,7);
% n = 8
X_hat_8 = replaceLast(X,8);
% n = 9
X_hat_9 = replaceLast(X,9);
% n = 10
X_hat_10 = replaceLast(X,10);
% n = 11
X_hat_11 = replaceLast(X,11);
% n = 12
X_hat_12 = replaceLast(X,12);
% n = 13
X_hat_13 = replaceLast(X,13);
% n = 14
X_hat_14 = replaceLast(X,14);
% n = 15
X_hat_15 = replaceLast(X,15);

% 
x_k_hat_1 = idct(X_hat_1);
x_k_hat_2 = idct(X_hat_2);
x_k_hat_3 = idct(X_hat_3);
x_k_hat_4 = idct(X_hat_4);
x_k_hat_5 = idct(X_hat_5);
x_k_hat_6 = idct(X_hat_6);
x_k_hat_7 = idct(X_hat_7);
x_k_hat_8 = idct(X_hat_8);
x_k_hat_9 = idct(X_hat_9);
x_k_hat_10 = idct(X_hat_10);
x_k_hat_11 = idct(X_hat_11);
x_k_hat_12 = idct(X_hat_12);
x_k_hat_13 = idct(X_hat_13);
x_k_hat_14 = idct(X_hat_14);
x_k_hat_15 = idct(X_hat_15);
%_______________________________
% a
snr_1 = snr(x_k, x_k - x_k_hat_1);
snr_2 = snr(x_k, x_k - x_k_hat_2);
snr_3 = snr(x_k, x_k - x_k_hat_3);
snr_4 = snr(x_k, x_k - x_k_hat_4);
snr_5 = snr(x_k, x_k - x_k_hat_5);
snr_6 = snr(x_k, x_k - x_k_hat_6);
snr_7 = snr(x_k, x_k - x_k_hat_7);
snr_8 = snr(x_k, x_k - x_k_hat_8);
snr_9 = snr(x_k, x_k - x_k_hat_9);
snr_10 = snr(x_k, x_k - x_k_hat_10);
snr_11 = snr(x_k, x_k - x_k_hat_11);
snr_12 = snr(x_k, x_k - x_k_hat_12);
snr_13 = snr(x_k, x_k - x_k_hat_13);
snr_14 = snr(x_k, x_k - x_k_hat_14);
snr_15 = snr(x_k, x_k - x_k_hat_15);

snr_s = [snr_1.' snr_2.' snr_3.' snr_4.' snr_5.' snr_6.' snr_7.' snr_8.' snr_9.' snr_10.' snr_11.' snr_12.' snr_13.' snr_14.' snr_15.'];
%_______________________________
% b
plot(snr_s);
ylabel('Signal to noise ratio') 
xlabel('n') 
title('Figure of SNRs as a function of n');



function [A] = funcX(n)
    A = [];
    for i=0:n
        A(end+1) = power(i-8,3) / 8;
    end
end

function [A] = funcY(n)
    A = [];
    for i=0:n
        A(end+1) = cos((3*i+1) * (pi/16) + 1) + sin((5*i+1)*pi/16);
    end
end

function [A_ht] = replaceLast(A, n)
    v_tmp = length(A);
    A_ht = A;
    n = n - 1;
    for i=v_tmp-n:v_tmp
        A_ht(i) = 0;
    end
end
