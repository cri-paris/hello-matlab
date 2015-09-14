function x = sequence2(n)
  acc = 8;
  for i = [9:n]
    if mod(acc,2) == acc / 2
      acc = acc/4;
    else
      acc = 2*acc+1;
    endif
  endfor
  x = acc;
end