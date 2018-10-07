%n= length(v);
%v(3)= [];
%n= length(v)
%s(1) = v;
function str= newton_interpolation(x_vector, y_vector)
% x_vector(1) = 2;
% x_vector(2) = 4.25;
% x_vector(3) = 5.25;
% x_vector(4) = 7.81;
% x_vector(5) = 9.2;
% x_vector(6) = 10.6;
% 
% y_vector(1) = 7.2;
% y_vector(2) = 7.1;
% y_vector(3) = 6;
% y_vector(4) = 5;
% y_vector(5) = 3.5;
% y_vector(6) = 5;

y_prev = y_vector;
step = 1;
b_req(1) = y_prev(1);
while(length(y_prev) > 1)
    counter = 1;
    for i = step + 1 : length(x_vector)
        l = ( y_prev(counter + 1) - y_prev(counter))/((x_vector(i) - x_vector(i - step) ));
        y_prev(counter) = l;
        if(counter == 1)
            b_req(step + 1) = l;
        end
        counter = counter + 1;
    end
    y_prev(length(y_prev)) = [];
    step = step + 1;
end
str = "";
multiple = "";
for i = 1 :  length(x_vector)
    if(i ~= 1 && b_req(i)>=0 )
        str = strcat(str,'+');
    end
    chr = num2str(b_req(i));
    str = strcat(str,chr);
    str = strcat(str,multiple);
    multiple = strcat(multiple,'*');
    multiple = strcat(multiple,'(');
    multiple = strcat(multiple,'x');
    if(x_vector(i) < 0)
        multiple = strcat(multiple,'+');
    else
        multiple = strcat(multiple,'-');
    end
    
    chr = num2str(abs(x_vector(i)));
    multiple = strcat(multiple,chr);
    multiple = strcat(multiple,')');
%     x = 1;
%     l = double (subs(str,x))
end
syms x;
y = sym(str);
simplify(y);
str = char(y);
k_vector = sort(x_vector);
k_vector
z = k_vector(1):0.1:k_vector(length(k_vector));
plot(z,subs(str, z));
hold on;
for i = 1 : length(x_vector)
    U = plot(x_vector(i), y_vector(i),'k*');
end
title('{\fontsize{18}\color[rgb]{white}Graph of Newton interplation}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}F(x)}')
end
