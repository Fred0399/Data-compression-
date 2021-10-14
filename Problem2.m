k=15;

x_k = funcX(k);
y_k = funcY(k); 


% a.1
X = fft(x_k);
Y = fft(y_k);
% a.3
X_hat = replaceSmallest(X);
Y_hat = replaceSmallest(Y);
% a.4
x_k_hat_2 = ifft(X_hat);
y_k_hat_2 = ifft(Y_hat);

table_1_2 = [X.' abs(X).' X_hat.'];
table_2_2 = [Y.' abs(Y).' Y_hat.'];
table_3_2 = [x_k.' x_k_hat_2.'];
table_4_2 = [y_k.' y_k_hat_2.'];

%_______________________________
% b
% plot(table_3_2);
% legend('x', 'x-hat');
% title('Figure of x and x-hat');
% plot(table_4_2);
% legend('y', 'y-hat');
% title('Figure of y and y-hat');
%________________________________
% c
err_x_2 = immse(x_k, x_k_hat_2);
err_y_2 = immse(y_k, y_k_hat_2);

snr_x_2 = snr(x_k, x_k - x_k_hat_2);
snr_y_2 = snr(y_k, y_k - y_k_hat_2);



function [A] = funcX(n)
    A = [];
    for i=0:15
        A(end+1) = power(i-8,3) / 8;
    end
end

function [A] = funcY(n)
    A = [];
    for i=0:15
        A(end+1) = cos((3*i+1) * (pi/16) + 1) + sin((5*i+1)*pi/16);
    end
end

function [A_ht] = replaceSmallest(A)
    [tmp_arr,I] = mink(abs(A), 10);
    A_ht = A
    for i=1:10
        A_ht(I(i)) = 0;
    end
end
