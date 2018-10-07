% % % inputs will be get from GUI
% myfunction = @(x)(x^2-3*x-2);
% x_lower = -3;
% x_upper = 0;
% epsilon = 0.0001;
% max_iterations = 20;
% % % end of inputs
% % 
% % 
% % % this part will be set after getting the inputs and will be set only one
% % % time
% % x = -(abs(x_lower) + abs(x_upper)):0.1:(abs(x_lower) + abs(x_upper));
% % % this is my function but without @(x) for plotting
% % y = (3*(x.^4))+ (6.1*(x.^3))-(2*(x.^2))+ (3*x) + 2;
% % z = x*0;
% x_itr = 0; 
% x_prev = 0;
% x_mid = (x_lower + x_upper ) /2;
% root=fastBisection(x_lower,x_upper,x_mid,x_prev,x_itr,epsilon,myfunction,20);
% disp('root:')
% disp(root)
% End of this part


% this condition should be checked and if it is false a message should
% appear
% if( myfunction(x_upper) *  myfunction(x_lower) > 0)
%   %cannot do Bisection write any message error in the GUI  
% end
% end of checking validation


% plotting part
%  clf
%  hold on;
%  grid on;
%  H = plot(x,y,'r',x,z,'k'); 
%  xlabel('x');
%  ylabel('y');
%  L = line([x_lower x_lower], get(gca, 'ylim'),'color','g');
%  set(L,'LineWidth',2.0);
%  U = line([x_upper x_upper], get(gca, 'ylim'),'color','y');
%  set(U,'LineWidth',2.0);
%  M = line([x_mid x_mid], get(gca, 'ylim'),'color','b');
%  set(M,'LineWidth',2.0);
 % End of plotting part

 
% this fuction for fast iterations and it will return the root of the
function [root,data,time] = Bisection(x_lower,x_upper,x_mid,x_prev,x_itr,eps,myfunction,max_iterations)
   tic;
    i=2;
    lower(1)=x_lower;
    upper(1)=x_upper;
    mid(1)=x_mid;
    err(1)=0;
data(1,1)=lower(1);
data(1,2)=upper(1);
data(1,3)=mid(1);
data(1,4)=err(1);
    while(x_itr < max_iterations)
        disp('while');
       s = BisectionMethod(x_mid,x_prev,x_lower,x_upper,myfunction,eps,x_itr);
       if(s(6) == 0)
           disp('break');
           break;
       else
           x_lower = s(1);
           x_upper = s(2);
           x_mid = s(3);
           x_prev = s(4);
           x_itr = s(5);
           lower(i)=x_lower;
           upper(i)=x_upper;
           mid(i)=x_mid;
           err(i)=abs((x_mid - x_prev));
           data(i,1)=lower(i);
           data(i,2)=upper(i);
           data(i,3)=mid(i);
           data(i,4)=err(i);
           i=i+1;
           fprintf('Lower %g upper %g mid %g eps %g\n',x_lower,x_upper,x_mid,abs(x_mid - x_prev));
       end 
 
    end

     root = x_mid;
     time=toc;
end
%end of this function


%function that calculate each iteration for slow iterations and return
%vector containing new x_lower x_upper x_mid x_prev x_itr (1 if accuracy doesn't exceed the eps )
function answer = BisectionMethod(x_mid,x_prev,x_lower,x_upper,myfunction,eps,x_itr)
if(abs(x_mid - x_prev) >= eps)
    myfunction =inline(char(myfunction));
    if(myfunction(x_mid) == 0)
        answer(1) = x_lower;
        answer(2) = x_upper;
        answer(3) = x_mid;
        answer(4) = x_prev;
        answer(5) = x_itr;
        answer(6) = 0;
        return;
    end
    
    if(myfunction(x_mid) * myfunction(x_upper) < 0 )
        x_lower = x_mid;
        x_prev = x_mid;
    else
        x_upper = x_mid;
        x_prev = x_mid;
    end
    x_itr = x_itr + 1;
    x_mid = ( x_lower + x_upper ) /2;
    answer(1) = x_lower;
    answer(2) = x_upper;
    answer(3) = x_mid;
    answer(4) = x_prev;
    answer(5) = x_itr;
    answer(6) = 1; 

else
    answer(1) = x_lower;
    answer(2) = x_upper;
    answer(3) = x_mid;
    answer(4) = x_prev;
    answer(5) = x_itr;
    answer(6) = 0;
    
end
end
% end of this function
 