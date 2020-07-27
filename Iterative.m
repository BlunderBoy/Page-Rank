function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  
  [numarNoduri, K, matriceAdiacenta, ~, ~] = readMatrix(nume);   
  
  [linii, coloane] = size(matriceAdiacenta);
  R = ones(numarNoduri, 1) / numarNoduri;
  v = ones(numarNoduri, 1);
  v = v * (1 - d) ./ numarNoduri;
  
  for i = 1 : coloane
    matriceAdiacenta(i, i) = 0;
    C(:, i) = matriceAdiacenta(i, :) / sum(matriceAdiacenta(i, :));
  end
  
  while (1)
    R1 = v + d * C * R; 
    if( norm(R - R1, 2) < eps )
        break;
    endif
    
  R = R1;
  endwhile
end