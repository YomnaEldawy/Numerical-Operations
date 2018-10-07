function results = getValues(func, values)
for i = 1 : length(values)
    results(i) = double(subs(func,values(i)));
end
end