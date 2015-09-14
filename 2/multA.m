function m = multA()
  a = loadA();
  m = a(:,3) .* a(:,5);  
endfunction