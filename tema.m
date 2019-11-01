function centroids = initCentroids(x, k)
  nrlin = size(x, 1);
    nrcol = size(x, 2);
      centroids = zeros(k, nrcol);
        randidx = randperm(nrlin);
endfunction
