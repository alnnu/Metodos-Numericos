function falsaPosicao()
  clc

  intervalo = [0,1];
  tolerancia = 1e-6;
  max_iter = 1000;

  [xs] = metodo(intervalo, tolerancia, max_iter);

  grafico(xs);

endfunction

function grafico(xs)
  x = [-2:0.1:2];
  y = zeros(1,length(x));
  for i=1:length(y)
    y(i) = f(x(i));
  endfor


  for i=1:length(xs)
  plot(x,y,'linewidth',2);

  hold "on";

  plot(xs(i),f(xs(i)),"o","linewidth",2)

  grid "on";
  set(gca,"fontsize",20);

  title(sprintf("itre: %d; f(%f)=%f",i,xs(i),f(xs(i))));

  hold "off";

  pause(0.2);

  endfor

endfunction


function y = f(x)
  y = x^3 + 2*x^2 -2;
endfunction

function [xs] = metodo(intervalo, tolerancia, max_iter)
  x_antigo = inf;

  erro = inf;

  x = inf;

  xs = zeros(1,max_iter);

  for iter=1:max_iter
    x = intervalo(2) - ((f(intervalo(2)) * (intervalo(1) - intervalo(2)))/(f(intervalo(1)) - f(intervalo(2))))
    xs(iter) = x;

    erro = abs(x - x_antigo)

    if erro < tolerancia
      break
    endif

    x_antigo = x

    if f(x)*f(intervalo(1)) > 0
      intervalo(1) = x;
    else
      intervalo(2) = x;
    endif
  endfor

  xs = xs(1:iter);


endfunction
