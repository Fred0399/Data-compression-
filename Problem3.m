% problem 3
k=15;

x_k = funcX(k);
y_k = funcY(k); 

%
X = dct(x_k);
Y = dct(y_k);
%
X_hat = replaceLast(X);
Y_hat = replaceLast(Y);
% 
x_k_hat_3 = idct(X_hat);
y_k_hat_3 = idct(Y_hat);
%_______________________________
% a
arr_X = [X.' X_hat.'];

arr_Y = [Y.' Y_hat.'];

arr_x_k = [x_k.' x_k_hat_3.'];

arr_y_k = [y_k.' y_k_hat_3.'];

%_______________________________
% b
% plot(arr_x_k);
% legend('x', 'x-hat');
% title('Figure of [x x-hat]')
% plot(arr_y_k);
% legend('y', 'y-hat');
% title('Figure of [y y-hat]')

%________________________________
% c
err_x_3 = immse(x_k, x_k_hat_3);
err_y_3 = immse(y_k, y_k_hat_3);

%________________________________
% d
snr_x_3 = snr(x_k, x_k - x_k_hat_3);
snr_y_3 = snr(y_k, y_k - y_k_hat_3);



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

function [A_ht] = replaceLast(A)
    v_tmp = length(A);
    A_ht = A;
    for i=v_tmp-9:v_tmp
        A_ht(i) = 0;
    end
end
