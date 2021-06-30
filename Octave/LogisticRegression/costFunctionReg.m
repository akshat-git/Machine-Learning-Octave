function [J, grad] = costFunctionReg(theta, X, y, lambda)
  m = length(y); % number of training examples
  
  J = 0;
  grad = zeros(size(theta));

  diff = zeros(m,1)
  disp(size(theta))
  for i = 1:m
    diff(i) = sum([y(i)*log(g(X(i,:)*theta))+(1-y(i))*log(1-g(X(i,:)*theta))]);
  end
  theta2j = 0
  for j = 2:size(grad)
    theta2j = theta2j+theta(j)**2
  end
  J =(-1*(sum(diff))/m)+lambda*theta2j/(2*m);


  error = 0;

  for i = 1:m
    error = error+(g(X(i,:)*theta)-y(i))*X(i,1);
  end
  grad(1) = 1/m*error;
  error = 0;
  
  for j = 2:size(grad)
    for i = 1:m
      error = error+(g(X(i,:)*theta)-y(i))*X(i,j);
    end
    grad(j) = (1/m*error)+(lambda*(theta(j))/m);
    error = 0;
  end
end
