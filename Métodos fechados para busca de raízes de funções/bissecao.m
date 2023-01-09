function bissecao()
  clc
  ## o metodo faz multiplas divisoes em um intervalo
  max_iter = 1000;
  tolerancia = 1e-5;
  intervalo = [-2,-1]; ## [Xi, Xu] -> [inicio, final]

  [x,xs,iter] = metodo(max_iter,tolerancia,intervalo);

  grafico2D(xs);

endfunction

function grafico2D(xs)
  ## vetores base para a curva
  x = [-2:0.1:4];
  y = zeros(1,length(x));

  for i=1:length(y)
    ## calcula o f(x)
    y(i) = f(x(i));
  endfor

  ## grafico animado
  for i=1:length(xs)
    ## plota a curva
    plot(x,y,'linewidth',2);

    ##"segura para poder plotar o resto de infomação
    hold "on";

    ##plota as iterações
    plot(xs(i),f(xs(i)),"o", 'linewidth',2);

    ##cria um grid
    grid "on";

    ##aumenta a fonte
    set(gca,'fontsize',20);

    ##cria um titulo
    title(sprintf('Iteracao: %i; f(%.6f) = %.6f', i, xs(i), f(xs(i))));


    hold "off";

    ##cria um pause na animação
    pause(0.1);
  endfor
endfunction

function y = f(x)
  ##function ussada para o metodo
  y = sin(x) * cos(x);
endfunction

function [x, xs, iter]  = metodo(max_iter, tolerancia, intervalo)
  ## usado para calcular o erro | X_antigo - Xu |
  x_antigo = inf;
  erro = inf;

  x = inf;

  ##Vetor para todos os x calculados
  xs = zeros(1,max_iter);

  for iter = 1 : max_iter
   x = (intervalo(1) + intervalo(2)) / 2;

   ##salva o x calculado
   xs(iter) = x;

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

  ## timinui o vetor para o tamanho necessario
  xs = xs(1:iter);

endfunction
