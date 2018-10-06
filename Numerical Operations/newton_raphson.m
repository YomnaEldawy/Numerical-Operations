function [root, iterations, data,time] = newton_raphson(x0,epsilon, maxIters, fx)
    tic;
    syms x;
    z = diff(fx(x));
    fxp = inline(char(z));
    [root, iterations, data] = implementation(x0, epsilon, maxIters, fx, fxp, 0, []);  	
  time=toc;
end


function [root, iterations, data] = implementation(xi, epsilon, maxIters, fx, fxp, iterations, data)
    if(fxp(xi)==0)
         msgbox(' ERROR:division by ZERO');
    else
    xii = xi - (fx(xi)/fxp(xi));
    error=abs((xii-xi)/xii);
    iterations = iterations+1;
    data = [data; xii error];
    if(error<=epsilon||iterations>maxIters)
        root = xii;
        return;
    end
    [root, iterations, data] = implementation(xii, epsilon, maxIters, fx, fxp, iterations, data);
    end

end


