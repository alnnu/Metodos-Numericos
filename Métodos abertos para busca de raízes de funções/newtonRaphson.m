function newtonRaphson()
metodo()

endfunction

function y = f(x)
  y = 2*x + x^3 - 2

endfunction

function y = df(x)
  y = 2 + 3*x^2
endfunction

function metodo()
  x1 = inf;
  x0 = inf;

  x0 = 1;

  for i=1:1000

    x1 = x0 - f(x0)/df(x0)

    erro = abs(x1 - x0)

    if erro < 1e-5
      break;
    else
      x0 = x1;
    endif
  endfor

endfunction
