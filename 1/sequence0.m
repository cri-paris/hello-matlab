function u = sequence0(n)
  if(n==0)
    u=0;
  else
    previous = sequence0(n-1);
    u = 2*cos(previous)+1;  
  endif
endfunction
