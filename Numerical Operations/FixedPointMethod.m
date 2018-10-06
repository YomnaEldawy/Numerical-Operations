function [root,data,time] = FixedPointMethod (funcG, x0, es, iter_max)
tic;
data(1,3)=0;
iter = 1;
func = inline(char(funcG));
    y1 = abs(x0);
    x = -(y1*2)-2:0.1:(y1*2)+5;
    y = x;
    z = 0*x;
    hold on
    grid on
     xlabel('{\fontsize{18}\color{white}x}')
     ylabel('{\fontsize{18}\color{white}y}')
    title('Graph of Fixed Point method');
    plot(x,y,'b',x,double(func(x)) + double(x),'r',x,z,'k');
    while (iter <= iter_max)
        flag = 0;
        xr_old(iter) = x0;
        xr(iter) = (func(xr_old(iter))) + double (xr_old(iter));  % g(x) has to be supplied
        if (xr(iter) ~= 0)
            ea(iter) = abs((xr(iter) - xr_old(iter)) / xr(iter)) * 100;
        end
        if (ea(iter) < es)
            break;
        end
        x0 = xr(iter);
        iter = iter + 1;
        if(iter > iter_max)
            flag = 1;
            iter = iter - 1;
            break;
        end
    end
    n = iter;
    for i = 1:n
        data(i,1)=xr(i);
        data(i,2)=xr_old(i);
        data(i,3)=ea(i);
        fprintf("     %d     %f   %f   %f   \n",i,xr_old(i),xr(i),ea(i));
    end
    root = xr(iter-1);
    if (flag == 1)
        fprintf('Exceed Max Iterations');
    end
time=toc;
end
