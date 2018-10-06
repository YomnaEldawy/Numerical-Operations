function check = checkConvergence(func , x0)
func = inline(char(func));
syms x;
z = diff(func(x)+x);
fxp = inline(char(z));
value = abs(fxp(x0))
if(value <= 1)
    check = 1;
else
    check = 0;
end
end