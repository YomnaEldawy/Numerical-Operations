% func = input('Enter Function in terms of x: ','s');

function [root,data,time] = secant(x0, x1, maxIter, maxerr, func)
    f = inline(char(func));
    data(1,1) = x0;
    data(1,2) = x1;
   
    data(1,4) = 0;
    tic;
    res = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));
     data(1,3) = res;
    disp(res);
    a(1) = res;
    iterations = 1;
   err(1)=0;
    i=2;
    while abs(f(res)) > maxerr &&( iterations < maxIter)
     res = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));
     a(end+1,:) = res;
     err(i)=abs((a(i)-a(i-1)) / a(i));
      data(i,1) = x0;
     x1 = x0;
     x0 = res;
     data(i,2) = x1;
      data(i,3) = res;
     data(i,4) = err(i);
     i=i+1;
     iterations = iterations + 1 ;
    end
    root = res;
    time=toc;
end


