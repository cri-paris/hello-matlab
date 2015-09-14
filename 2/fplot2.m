function fplot2(from,to)
    c = @(x) cos(x)^2;
    s = @(x) sin(x);
    hold on;
    cellfun(@(func) fplot(func, [from,to]), {c, s});
    legend('fancy cos^2(x)','fancy sin(x)');   
    hold off;    
end