function y = pra2(a,b,c)
  vec = [a,b,c];
  m = max(vec);
  vec(find(vec==m,1,'first')) = [];
  y = prod(vec);
endfunction