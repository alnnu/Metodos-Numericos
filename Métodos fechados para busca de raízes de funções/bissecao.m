function bissecao()
  ## o metodo faz multiplas divisoes em um intervalo

  max_iter = 100;
  tolerancia = 1e-5;
  intervalo = [1,1.5]; ## [Xi, Xu] -> [inicio, final]

  metodo(max_iter,tolerancia,intervalo)
endfunction

function y = f(x)
  y = x^3 - 2 * x^2 + x - 0,275;
endfunction

function metodo(max_iter, tolerancia, intervalo)
  ## usado para calcular o erro | X_antigo - Xu |
  x_antigo = inf;
  erro = inf;

  x = inf;

  for iter = 1 : max_iter
    if erro <= tolerancia
      break
    endif
    x = (intervalo(1) + intervalo(2))/2;

    if f(x) * f(intervalo(1)) > 0
      erro = abs(intervalo(2) - x);
      intervalo(2) = x;
    elseif f(x) * f(intervalo(1)) < 0
       erro = abs(intervalo(1) - x);
       intervalo(1) = x;
    else
       break
    endif

  endfor
endfunction
