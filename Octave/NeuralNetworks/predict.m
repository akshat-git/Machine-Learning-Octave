function p = predict(Theta1, Theta2, X)

m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);


size(Theta1), size(Theta2), size(X)
% Parameters: 401 inputs => 25 +1 26 => 10 outputs
X = [ones(m,1) X];
% X: 5000 x 401
a = [ones(m,1) sigmoid(X*Theta1')];
[max, p] = max(sigmoid(a*Theta2'), [], 2);


end
