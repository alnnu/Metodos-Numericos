function exemplosGraficos()
  x = [1,2,3,4,5,6,7,8,9]
  y = [1.5,2,2.7,3.1,2.6,3.5,4,4.5,4.6]

  pontoX = [3,4,5]
  pontoY = [2.7,3.1,2.6]

  Graficos(x,y,x,y)

endfunction


function grafico2D(x,y)
  figure(1);
  plot(x,y,'linewidth',2);
  grid "on";
  set(gca,'fontsize',20);
endfunction

function grafico2DAnimado(x,y, pontoX, pontoY)
  figure(1)
  for i=1 : length(pontoX)
     plot(x,y,'linewidth',2);
     hold "on";
     plot(pontoX(i), pontoY(i), 'o');
     grid "on";
     set(gca,'fontsize',20);
     hold "off"
     pause(0.1)
  endfor
endfunction

function Graficos(x1,y1,x2,y2)
  figure(1)

  subplot(2,1,1)
  plot(x1,y1,'linewidth', 2)
  grid "on"
  set(gca,'fontsize', 20)
  title(sprintf("grafico 1"))

  subplot(2,1,2)
  plot(x2,y2,'linewidth',2)
  grid "on"
  set(gca,'fontsize',20)
  title(sprintf("grafico 2"))

endfunction
