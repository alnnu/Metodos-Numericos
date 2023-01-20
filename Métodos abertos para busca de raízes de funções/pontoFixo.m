function pontoFixo()
  metodo()

endfunction


function y = f(x)
  y = e^(-x)
endfunction


function metodo()
  x1 = inf;
  intervalo = [0,1];
  x0 = (intervalo(2) + intervalo(1))/2;

  erro = inf;

  for i=1:1000
    x1 = f(x0)

    erro = abs(x1 - x0)

    if erro < 1e-5
      break;
    else
      x0 = x1;
    endif
  endfor


endfunction
