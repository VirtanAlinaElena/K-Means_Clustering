function [] = view_clusters(points, centroids)
  
  linPoints = size(points, 1);
  linCentroids = size(centroids, 1); 
  for i = 1 : linPoints
    k = 1; 
    distMin = sum((points(i, :) - centroids(1,:)) .^ 2);
    for j = 2 : linCentroids
      dist = sum((points(i, :) - centroids(j, :)) .^ 2);
      if (dist < distMin)
        distMin = dist;
        k = j;
      endif
    endfor
    indices(i) = k;
  endfor
  
  colors = ['r' 'g' 'b' 'y' 'c' 'm' 'k']; 
  % asta daca nu sunt mai mult de 7 centroizi
  
  hold on;
  
  for i = 1 : size(centroids, 1)
    xi = points(indices == i, 1);
    yi = points(indices == i, 2);
    zi = points(indices == i, 3);
    scatter3(xi', yi', zi', 100, colors(i), 'filled');    
  endfor 
  
  hold off;
 
  title('Reprezentare grafica');
  xlabel('Coordonata x');
  ylabel('Coordonata y');
  zlabel('Coordonata z');
end