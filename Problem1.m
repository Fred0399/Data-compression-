% TASK_1
%____________________________
% a
x_1 = 'ababcbacb';
x_2 = 'The cat with that hat';

[y_1, L_1, B_1] = BWT(x_1);
[y_2, L_2, B_2] = BWT(x_2);
%____________________________
% b
[orgB_1,org_1] = iBWT(y_1,1,8);



function [y,L,B] = BWT(a)
    tmp_a = a;
    A=strings(length(a),1);
    for v = 1:length(a)
        A(v)=string(tmp_a);
        tmp_a(end+1) = tmp_a(1);
        tmp_a=tmp_a(2:end); 
        %disp(a)
    end
    B = sortrows(A);
    
    y = '';
    for k = 1:length(B)
        vtt = char(B(k));
        
        y  = strcat(y, string(vtt(end)));
        disp(vtt(end));
    end
    
    L=find(ismember(B,a,'rows'));
end

function [org, org_txt] = iBWT(last_col, ind, cc)
    org = [char(last_col)];
    for i = 1:cc
        A_1_s = sortrows(org.');
        org = [char(last_col);A_1_s.'];
        disp(strcat('ITERATION: ',string(i)));
        disp(org.');
%         disp("SOOOOOOOOOO");
%         disp(A_1_s);
    end
    org = [A_1_s.';char(last_col)].';
    org_txt = org(ind:cc+1:end,:);
end