function u = sequence1(n)
  if(n==0)
    u=1;
  else
    previous = sequence1(n-1);
    u = previous + n^2 -4;
  endif
endfunction