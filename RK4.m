function [sol] = RK4(a, b, N, y0, functie)
  h = (b-a)/N;
  xi = a;
  yi = y0;
  sol(1) = y0;
  for i = 1 : N
    k1 = h * functie(xi, yi);
    k2 = h * functie(xi + h/2, yi + k1/2);
    k3 = h * functie(xi + h/2, yi + k2/2);
    k4 = h * functie(xi + h, yi + k3);
    yi = yi + (k1 + 2 * k2 + 2 * k3 + k4)/6;
    xi = xi + h;
    sol(i+1) = yi;  
  endfor
endfunction