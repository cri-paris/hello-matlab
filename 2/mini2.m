function [m,i] = mini2(v)
  m = min(v);
  i = find(v == m,1);
end