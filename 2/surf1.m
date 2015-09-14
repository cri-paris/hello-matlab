function surf1(x,y)
    [X,Y] = meshgrid(x , y);
    Z = sin(X.*6) + Y;
    surf(X,Y,Z);
end