function [x y z] = test(points,centroids)
  indices = [1 1 3 2 3 3];
  A = [1 4 6; 4 6 3; 7 4 2; 2 3 5; 6 3 2; 5 7 3];
  B = [2 4 6; 4 6 3; 7 4 2; 2 3 5; 6 3 2; 5 7 3];
  
  
  colors = ['r' 'g' 'b' 'y' 'c' 'm' 'k']
  
  hold on;
 
  for i = 1 : size(centroids, 1)
    xi = A(indices == i, 1);
    yi = A(indices == i, 2);
    zi = A(indices == i, 3);
    scatter3(xi', yi', zi', 30, colors(i), 'filled');
  %  x = [x xi'];
  %  y = [y yi'];
  %  z = [z zi'];  
  endfor


  hold off;
  

  title('Reprezentare grafica');
  xlabel('Coordonata x');
  ylabel('Coordonata y');
  zlabel('Coordonata z');
endfunction