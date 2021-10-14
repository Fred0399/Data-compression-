% problem 4
k=15;

x_k = funcX(k);
y_k = funcY(k); 

%_____________________________
% a ?????????????????????????
%
X = (1/(k+1).^(1/2)) * hadamard(k+1) * x_k.';
Y = (1/(k+1).^(1/2)) * hadamard(k+1) * y_k.';
% 
X_hat = replaceSmallest(X);
Y_hat = replaceSmallest(Y);
% 
x_k_hat = (1/(k+1).^(1/2)) * hadamard(k+1) * X_hat;
y_k_hat = (1/(k+1).^(1/2)) * hadamard(k+1) * Y_hat;
% report of tables
table_1 = [X abs(X) X_hat];
table_2 = [Y abs(Y) Y_hat];
table_3 = [x_k.' x_k_hat];
table_4 = [y_k.' y_k_hat];
%_______________________________
% b
err_x = immse(x_k.', x_k_hat);
err_y = immse(y_k.', y_k_hat);
%________________________________
% c
plot([x_k.' x_k_hat_2.' x_k_hat_3.' x_k_hat]);
legend('x-4', 'x-hat_2', 'x-hat_3', 'x-hat_4');
title('Figure of x-4 and other x-(2,3,4) hats');
% plot([y_k.' y_k_hat_2.' y_k_hat_3.' y_k_hat]);
% legend('y-4', 'y-hat_2', 'y-hat_3', 'y-hat_4');
% title('Figure of y-4 and other y-(2,3,4) hats');
%___________________________________________________
% d
% 


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
