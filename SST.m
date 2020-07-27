function [x] = SST (A, b)
  [linii coloane] = size(A);
  
  x = zeros(linii, 1);
  x(linii) = b(linii) / A(linii, linii);
  
  for i = linii - 1 : -1: 1
    x(i) = (b(i)- A(i, i + 1 : linii) * x(i + 1 : linii)) / A(i, i);  
  endfor

endfunction
