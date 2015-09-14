function sqrtPlot(v)
  if isvector(v) && length(v)>50
    plot(v.^2);
  else
    disp("vector with > 50 elements is required")
  end
end