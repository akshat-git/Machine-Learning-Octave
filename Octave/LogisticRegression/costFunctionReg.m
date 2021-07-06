function [J, grad] = costFunctionReg(theta, X, y, lambda)
  m = length(y); % number of training examples
  J = 0;
  grad = zeros(size(theta));
  diff = zeros(m,1);
  for iter = 1:m
    diff(iter) = sum(y(iter)*log(g(X(iter,:)*theta))+(1-y(iter))*log(1-g(X(iter,:)*theta)));
  end
  theta2j = 0;
  for j = 2:size(grad)
    theta2j = theta2j+theta(j)**2;
  end
  J =(-1*(sum(diff))/m)+lambda*theta2j/(2*m);

  error = 0;

  for j = 1:m
    error = error+(g(X(j,:)*theta)-y(j))*X(j,1);
  end
  grad(1) = 1/m*error;
  error = 0;

  
  for j = 2:size(grad)
    for iter = 1:m
      error = error+(g(X(iter,:)*theta)-y(iter))*X(iter,j);
    end
    grad(j) = (1/m*error)+(lambda*(theta(j))/m);
    error = 0;
  end


end
