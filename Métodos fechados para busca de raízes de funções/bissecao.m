function bissecao()
  clc
  ## o metodo faz multiplas divisoes em um intervalo
  max_iter = 1000;
  tolerancia = 1e-5;
  intervalo = [0,1]; ## [Xi, Xu] -> [inicio, final]

  metodo(max_iter,tolerancia,intervalo);
endfunction

function y = f(x)
  ##function ussada para o metodo
  y = x^3 + 2*x^2 - 2;
endfunction

function metodo(max_iter, tolerancia, intervalo)
  ## usado para calcular o erro | X_antigo - Xu |
  x_antigo = inf;
  erro = inf;

  x = inf;

  for iter = 1 : max_iter
   x = (intervalo(1) + intervalo(2)) / 2

   ##calculo do erro
   erro = abs(x - x_antigo);


   if erro <= tolerancia
     #atingiu a tolerancia
     break
   endif


   ##salva o ultimo valor de X calculado
   x_antigo = x;



   ##velifica em que parte o F(x) esta
   if f(x)*f(intervalo(1)) > 0
     ## primeira parte ,ou seja, F(x) e F(xi) tem o mesmo sinal (-) * (-) = + e (+) * (+) = +
    intervalo(1) =  x;
   else
    ## segunda parte
    intervalo(2) = x;
   endif

  endfor

endfunction
