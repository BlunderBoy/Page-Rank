
function [numarNoduri, K, matriceAdiacenta, valoare1, valoare2] = readMatrix(nume)
  
  descriptor = fopen(nume);
  
  aux = dlmread(descriptor);
  [linii, coloane ] = size(aux);
  
  numarNoduri = aux(1,1);
  matriceAdiacenta = zeros(numarNoduri, numarNoduri);
  
  offset = 1;
  offsetColoana = 2;
  K = zeros(numarNoduri, 1);
  
  for i = 1 : numarNoduri 
     nod = aux(i + offset, 1);
     numarVecini = aux(i + offset, 2);
     
     for j = 1 : numarVecini
        K(i) = numarVecini; 
          matriceAdiacenta(nod, aux(i + offset, offsetColoana + j)) = 1;
     endfor
  endfor
  valoare1 = 0;
  valoare2 = 0;
  valoare1 = aux(linii - 1, 1);
  valoare2 = aux(linii, 1);
end