%  
% close all
% clear all
%  fun = 'x^4-9*x^3-2*x^2+120*x-130';
% % % % % funct = inline(fun,'x') ;
% % % %  %disp(funct)
% % % % %a=get(fun,'string');
% % % % % axes(handles.axes1)
% % % % ezplot(fun)
% % % % % set(handles.axes1,'XMinorTick','on')
% % % % grid on
%   initialvalue = -3;
% maxit = 50;
%  es = 0.0001;
%  [finalRoot,data,final,time]=BirgeVieta1_method(fun,initialvalue,maxit,es);
 
function [finalRoot,data,final,time]=BirgeVieta_method(fun,initialvalue,maxit,es)
symbolicfun = evalin(symengine, fun);
tic;


a = coeffs(symbolicfun,'all');

[sz1,sz2] = size(a);
degree = sz2-1;
j=1;

% while(degree >0)


iter = maxit;
%     clear root;
%     clear precision;
root(1) = initialvalue;

[value,b,c] = f(a,degree,root(1),1);
%     disp(a)
%     double(b)
%     double(c)

abc = [a;double(b);double(c)];
final(:,:,1)=double(abc);

root(2) = root(1) - value;
precision(1) = 0;
relative_err(1) = 0;
precision(2) = abs(root(2) - root(1));
relative_err(2) = abs(precision(2)/ root(2));
iter = iter -1;
data(1,1)=root(1);
data(1,2)= relative_err(1);
data(2,1)=root(2);
data(2,2)= relative_err(2);
i = 2;
[value,b1,c1] = f(a,degree,root(i),0);
while((es<abs(value)) && (0<iter))
    [value,b,c] = f(a,degree,root(i),1); 
    abc = [a;double(b);double(c)];
    final(:,:,i)=double(abc);
    
    
    root(i+1) = root(i) - value;
    precision(i+1) = abs(root(i+1) - root(i));
    relative_err(i+1) = abs(precision(i+1)/ root(i+1));
    iter = iter -1;
    
    i=i+1;
    [value,b1,c1] = f(a,degree,root(i),0);
    data(i,1)=root(i);
    data(i,2)= relative_err(i);
    
end

%     if(0<iter)
%
          n= length (root);
         finalRoot=root(n);
%          k = 1:n;
% %         disp('new root')
% %         disp(iteration)
%          disp('iteration      x        precision   relative_error')
%       out = [k'    root(1:n)'   precision(1:n)'   relative_err(1:n)'];
%         disp(out)


%         y=a(1);
%         data(j,1)=root(n);
%         data(j,2)=relative_err(n);
%
%         j=j+1;
%    for i=2:degree
%     y=y*root(n);
%     y=y+a(i);
%     a(i)=y;
%    end
%    a(degree+1)=[];
% degree = degree -1;
%     else
%     disp('There are no more real roots left.');
%         break;
%     end
%
% end


time= toc;
end

function [value,b,c] = f(a,degree,r,division)
clear b;

fx = a(1);
b(1) = a(1);
for i=2:degree+1
    fx=fx*r;
     fx=fx+a(i);
    b(i) = fx;
    
end
if division
    
    fpx = a(1);
    c(1)=a(1);
    for i =2:degree
        fpx=fpx*r;
                  fpx=fpx+b(i);
        c(i)=fpx;
        
    end
    value = fx/fpx;
    c(end+1)=0;
else
    value = fx;
    b='';
    c='';
end

end



