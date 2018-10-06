% x_vector(1) = 10;
% x_vector(2) = 15;
% x_vector(3) = 20;
%
% y_vector(1) = 227.04 ;
% y_vector(2) = 362.78 ;
% y_vector(3) =  517.35 ;
% x_vector
function func = Lagrange(x_vector, y_vector)
tic;
func = "";
for i = 1 : length(x_vector)
    if( i ~= 1)
        func = strcat(func,'+');
    end
    term = "";
    counter = 0;
    for j = 1 :  length(x_vector)
        if(i ~= j)
            term = strcat(term,'(');
            term = strcat(term,'(');
            term = strcat(term,'x');
            if(x_vector(j) < 0)
                term = strcat(term,'+');
            else
                term = strcat(term,'-');
            end
            chr = num2str(abs(x_vector(j)));
            term = strcat(term,chr);
            term = strcat(term,')');
            term = strcat(term,'/');
            term = strcat(term,'(');
            chr = num2str(x_vector(i));
            term = strcat(term,chr);
            if(x_vector(j) < 0)
                term = strcat(term,'+');
            else
                term = strcat(term,'-');
            end
            chr = num2str(abs(x_vector(j)));
            term = strcat(term,chr);
            term = strcat(term,')');
            term = strcat(term,')');
            
            if(counter + 1 < length(x_vector) - 1)
                term = strcat(term,'*');
            end
            counter = counter + 1;
        end
        
    end
    l_vector(i) = term;
    func = strcat(func,term);
    func = strcat(func,'*');
    chr = num2str(y_vector(i));
    func = strcat(func,chr);
end
syms x;
y = sym(func);
simplify(y);
func = char(y);
k_vector = sort(x_vector);
z = k_vector(1):0.1:k_vector(length(k_vector));
plot(z,double(subs(func,z)),'r');
hold on;
%plot(z,double(subs(l_vector(2),z)),'b');

for i = 1 : length(x_vector)
    U = plot(x_vector(i), y_vector(i),'k*');
end
for i = 1 : length(l_vector)
    hold on
    plot(z,double(subs(l_vector(i),z)),'b');
end
title('{\fontsize{18}\color[rgb]{white}Graph of Lagrange interplation}')
                xlabel('{\fontsize{18}\color{white}x}')
                ylabel('{\fontsize{18}\color{white}F(x)}')
timeElapsed = toc;
end