% inputs will be get from GUI
% myfunction = @(x) x.^3-3*x+1;
% x_lower = 1.5;
% x_upper = 0.11;
% max_iterations = 20;
% eps = 0.0001;
% end of inputs


% this part will be set after getting the inputs and will be set only one
% time
% x = -(abs(x_lower) + abs(x_upper)):0.1:(abs(x_lower) + abs(x_upper));
% % this is my function but without @(x) for plotting
% y = x.^3-3*x+1;
% z = x*0;
% x_itr = 0; 
% x_prev = 0;
% x_mid = ((x_lower* myfunction(x_upper)) - (x_upper* myfunction(x_lower)) ) /(myfunction(x_upper) - myfunction(x_lower));
% End of this part


% this condition should be checked and if it is false a message should
% appear
% if( myfunction(x_upper) *  myfunction(x_lower) > 0)
%   %cannot do false position write any message error in the GUI  
% end
% end of checking validation


%plotting part
%  y_l = myfunction(x_lower);
%  y_u = myfunction(x_upper);
%  clf
%  H = plot(x,y,'r',x,z,'k'); 
%  hold on;
%  grid on;
%  set(H,'LineWidth',1.0);
%  xlabel('x');
%  ylabel('y');
%  L = plot([x_upper x_lower], [y_u y_l]);
%  set(L,'LineWidth',2.0);
%  U = plot(x_lower, y_l,'r*');
%  set(U,'LineWidth',2.0);
%  M = plot(x_upper, y_u,'r*');
%  set(M,'LineWidth',2.0);
%  R =  plot(x_mid,0,'r*');
%  set(R,'LineWidth',2.0);
 % End of plotting part


% this fuction for fast iterations and it will return the root of the
function [root,data,time] = FalsePosition(x_lower,x_upper,x_mid,x_prev,x_itr,eps,myfunction,max_iterations)
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
   s = falsePositionMethod(x_mid,x_prev,x_lower,x_upper,myfunction,eps,x_itr);
   if(s(6) == 0)
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
       err(i)=abs((x_mid - x_prev)/x_mid);
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
% end of this function



%function that calculate each iteration for slow iterations and return
%vector containing new x_lower x_upper x_mid x_prev x_itr (1 if accuracy doesn't exceed the eps )
function answer = falsePositionMethod(x_mid,x_prev,x_lower,x_upper,myfunction,eps,x_itr)
if(abs(x_mid - x_prev) >= eps)
    
    if(myfunction(x_mid) == 0)
        answer(1) = x_lower;
        answer(2) = x_upper;
        answer(3) = x_mid;
        answer(4) = x_prev;
        answer(5) = x_itr;
        answer(6) = 0;
        return;
    end
   
    if(myfunction(x_mid)*myfunction(x_upper) < 0) 
        x_lower = x_mid;
        x_prev = x_mid;
    else
        x_upper = x_mid;
        x_prev = x_mid;
    end
    x_itr = x_itr + 1;
    x_mid = ((x_lower* myfunction(x_upper)) - (x_upper* myfunction(x_lower)) ) /(myfunction(x_upper) - myfunction(x_lower));
    
 
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