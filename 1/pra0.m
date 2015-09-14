function y = pra0(a1,a2,a3,a4,a5)
  vec = [a1,a2,a3,a4,a5]
  if(any(vec==0)) 
    y = sum(vec); 
  else 
    y = prod(vec);
  endif
endfunction