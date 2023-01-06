function exemplosGraficos()
  x = [1,2,3,4,5,6,7,8,9]
  y = [1.5,2,2.7,3.1,2.6,3.5,4,4.5,4.6]

  pontoX = [3,4,5]
  pontoY = [2.7,3.1,2.6]

  grafico2DAnimado(x,y,pontoX,pontoY)

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
