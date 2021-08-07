function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training eXamples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

J = (sum((X*theta-y).^2)/(2*m)+sum(lambda*(theta(2:end,:).^2))/(2*m));

% GRADIENT WORK
add = (lambda/m)*theta;
add(1) = 0;
diff = ones(size(X));
for j = 1:size(X,2)
  diff(:,j) = ((X*theta)-y);
end
% diff = diff.*X
for i = 1:size(X,1)
  for j = 1:size(X,2)
    diff(i,j) = diff(i,j)*X(i,j);
  end
end
grad = sum(diff)/m;
for n = 1:length(grad)
  grad(n) = grad(n)+add(n);
end
grad = grad';









% =========================================================================

grad = grad(:);

end
