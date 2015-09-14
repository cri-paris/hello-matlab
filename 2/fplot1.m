function fplot1(from,to)
    f = @(x) 3 * x^2 - 6 * x + 1;
    fplot(f,[from,to]);    
end