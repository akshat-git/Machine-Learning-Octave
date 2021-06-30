function cost = J (theta)
  global x;
  global m;
  global y;
  theta
  diff = ((x*[theta])-y).^2;
  cost =(sum(diff))/(2*m);
endfunction