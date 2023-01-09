function falsaPosicao()
  clc

  intervalo = [0,1];
  tolerancia = 1e-5;
  max_iter = 1000;

  metodo(intervalo, tolerancia, max_iter);

endfunction


function y = f(x)
  y = x^3 + 2*x^2 -2;
endfunction

function metodo(intervalo, tolerancia, max_iter)
  x_antigo = inf;

  erro = inf;

  x = inf;

  for iter=1:max_iter

    x = intervalo(2) - ((f(intervalo(2)) * (intervalo(1) - intervalo(2)))/(f(intervalo(1)) - f(intervalo(2))))
    erro = abs(x - x_antigo)

    if erro < tolerancia
      break
    endif

    x_antigo = x

    if f(x) * f(intervalo(1)) > 0
      intevalo(1) = x;
    else
      intervalo(2) = x
    endif


  endfor


endfunction
