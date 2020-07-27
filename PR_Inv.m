function rezultat = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
  [linii coloane] = size(A);
  Q = zeros(linii, coloane);
  R = zeros(linii); 
    
   for i = 1 : coloane
     R(i, i) = norm(A(:, i), 2);
     Q(:, i) = A(:,i) / R(i,i);
      
     for j = i + 1 : coloane
       R(i,j) = Q(:, i)' * A(:, j);
       A(:, j) = A(:, j) - Q(:, i) * R(i, j);
     endfor
   endfor
    
   identitate = eye(linii);  
   for i = 1 : coloane
    rezultat(:, i) = SST(R, Q' * identitate(:, i));
  endfor
  
endfunction