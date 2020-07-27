function y = Apartenenta(x, valoare1, valoare2)
  diferenta = abs(valoare1 - valoare2); 
  
	a = 1 / diferenta;
  b = 1 - valoare2 / diferenta;
  
  y = a * x + b;
end