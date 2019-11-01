function [centroids] = clustering_pc(points, NC)

  %1)alegerea aleatoare a celor NC centroizi
  linPoints = size(points, 1);
  colPoints = size(points, 2);
  
  centroids = zeros(NC, colPoints); 
  randidx = randperm(linPoints, NC);
  centroids = points(randidx, :);
  
  ok = 0; %pp ca nu am gasit pozitii fixe ale centroizilor 
  while (ok == 0)
   %2)fiecare punct din multime e atr grupului repr de cel mai apropiat centroid
    
    linCentroids = size(centroids, 1); 
   % initializez vectorul care asociaza fiecarui punct centroidul corespunzator
    indices = zeros(linPoints, 1);
                  
    for i = 1 : linPoints
    %{ 
     calculez distanta euclidiana de la punctul i la fiecare centroid si 
     asociez punctului centroidul la care distanta e minima 
    %}
      
      k = 1; 
      distMin = sum((points(i, :) - centroids(1,:)) .^ 2);
      for j = 2 : linCentroids
        dist = sum((points(i, :) - centroids(j, :)) .^ 2);
        if (dist < distMin )
          distMin = dist;
          k = j;
        endif
      endfor
      indices(i) = k;
    endfor
    
    old_centroids = centroids;
    % recalcularea pozitiilor centroizilor
    centroids = zeros(NC, colPoints);
   
    for i = 1 : NC
      xi = points(indices == i, :);
      nr = size(xi, 1);
      centroids(i, :) = (1/nr) * [sum(xi(:, 1)) sum(xi(:, 2)) sum(xi(:, 3))]; 
    endfor
    if (old_centroids == centroids) 
      ok = 1;
    endif
  endwhile
endfunction