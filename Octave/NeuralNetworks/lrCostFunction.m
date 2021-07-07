function [J, grad] = lrCostFunction(theta, X, y, lambda)

m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));



J = sum((-1*y.*log(sigmoid(X*theta)))-((1-y).*log(1-sigmoid(X*theta))))/m;
reg = sum(theta(2:end).^2)*lambda/(2*m);
J = J + reg;
grad = X'*(sigmoid(X*theta)-y)/m;
temp = theta; 
temp(1) = 0;   % because we don't add anything for j = 0  
grad = grad + temp*lambda/m;







% =============================================================

grad = grad(:);

end
