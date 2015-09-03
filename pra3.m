function y = pra3(varargin)
  vec = [varargin{:}]
  u = unique(vec);
  if length(u)==length(vec)
    y = 1;
  else
    y = 0;
  endif  
endfunction