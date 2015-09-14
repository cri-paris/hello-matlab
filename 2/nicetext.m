function nicetext(m)
    [~,cols] = size(m);
    for c = 1:cols
        col = m(:,c);
        disp(col);
    end    
end