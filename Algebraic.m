function R = Algebraic(nume, d)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
  [numarNoduri, K, matriceAdiacenta] = readMatrix(nume);   
  
  [linii, coloane] = size(matriceAdiacenta);
  R = ones(numarNoduri, 1) / numarNoduri;
  v = ones(numarNoduri, 1);
  v = v * (1 - d) ./ numarNoduri;
  I = eye(numarNoduri);
  
  for i = 1 : coloane
    matriceAdiacenta(i, i) = 0;
    C(:, i) = matriceAdiacenta(i, :) / sum(matriceAdiacenta(i, :));
  end
  
  R = PR_Inv(I - d * C ) * v;
end