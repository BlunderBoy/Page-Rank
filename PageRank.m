function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  numeAux = nume;
  [numarNoduri, K, matriceAdiacenta, valoare1, valoare2] = readMatrix(nume);
  
  nume = strcat(nume, ".out");
  descriptorScriere = fopen(nume, "w");
  
  R1 = Iterative(numeAux, d, eps);
  R2 = Algebraic(numeAux, d);
  
  fprintf(descriptorScriere, "%d\n\n" , numarNoduri);
  fprintf(descriptorScriere, "%f\n", R1);
  fprintf(descriptorScriere, "\n");
  fprintf(descriptorScriere, "%f\n", R2);
  
  [linii, coloane] = size(R2);
  [R2, rankuri] = sort(R2, "descend");
  
  fprintf(descriptorScriere, "\n");
  for i = 1 : linii
    fprintf(descriptorScriere, "%d %d", i, rankuri(i));
    if( Apartenenta(R2(i,1), valoare1, valoare2) > 0)
      fprintf(descriptorScriere, " %f\n", Apartenenta(R2(i,1), valoare1, valoare2));
    else
      fprintf(descriptorScriere, " %f\n", 0);
    endif
  endfor
  
  fclose(descriptorScriere);
end