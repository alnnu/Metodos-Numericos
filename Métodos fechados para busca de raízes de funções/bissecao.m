function bissecao()
  clc
  ## o metodo faz multiplas divisoes em um intervalo

  max_iter = 1000;
  tolerancia = 1e-15;
  intervalo = [0,1]; ## [Xi, Xu] -> [inicio, final]

  metodo(max_iter,tolerancia,intervalo);
endfunction

function y = f(x)
  y = x^3 + 2*x^2 - 2;
endfunction

function metodo(max_iter, tolerancia, intervalo)
  ## usado para calcular o erro | X_antigo - Xu |
  x_antigo = inf;
  erro = inf;

  x = inf;

  for iter = 1 : max_iter
   x = (intervalo(1) + intervalo(2)) / 2
   erro = abs(x - x_antigo);


   if erro <= tolerancia
     break
   endif


   x_antigo = x;


   if f(x)*f(intervalo(1)) > 0
    intervalo(1) =  x;
   else
    intervalo(2) = x;
   endif

  endfor

endfunction
