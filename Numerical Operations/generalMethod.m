
function [data,time]= generalMethod(func)
tic;
dataValues = [];
eps = 0.000001;
max_iterations = 100;
i = -50;
counter = 1;
x_itr = 0;
fun = inline(char(func));

while(i <= 50)
    x_lower = i;
    x_upper = i+1;
    x_mid = (x_lower + x_upper ) /2;
    x_prev = x_mid+ 1;
    if(fun(x_upper) *  fun(x_lower) < 0)
        s =  Bisection(x_lower,x_upper,x_mid,x_prev,x_itr,eps,fun,max_iterations);
         q = fun(s);
        if(round(q,5) == 0)
        dataValues(counter) = round(s,4);
        counter = counter + 1; 
        end
    else
        [root,dataaa] = secant(x_lower,x_upper,max_iterations,eps,fun);
         q = fun(root);
        
     if(round(q,5) == 0 )
         
         dataValues(counter) = round(root,4);
           counter = counter + 1;
    
     end 
    end
   i =  i + 1;
end
 data = unique(dataValues);
 time=toc;
end
