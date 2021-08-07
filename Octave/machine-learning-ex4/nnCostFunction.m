function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
% disp(size(Theta1))
% disp(size(Theta2))
% disp(size(X))
% Setup some useful variables
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


acc = 0;
h = 0;
for i = 1:m
  mapped = zeros(1,num_labels);
  mapped(y(i)) = 1;
  % disp(size(X(i,:)))
  h = sigmoid([1 X(i,:)]*Theta1');
  h = sigmoid([1 h]*Theta2');
  for k = 1:num_labels
	acc = acc-((mapped(k)*log(h(k))+(1-mapped(k))*log(1-h(k)))/m);
  end
end
for j = 1:hidden_layer_size
  for k = 2:input_layer_size+1
    acc = acc+(Theta1(j,k)^2)*(lambda/(2*m));
  end
end
for j = 1:num_labels
  for k = 2:hidden_layer_size+1
    acc = acc+(Theta2(j,k)^2)*(lambda/(2*m));
  end
end
J = acc;

% -------------------------------------------------
% Gradient Work

Xcol = [ones(m,1) X];
capdelta1 = zeros(size(Theta1));
capdelta2 = zeros(size(Theta2));
for t = 1:m
  a = Xcol(t);
  h = zeros(1,num_labels);
  delta2 = zeros(hidden_layer_size+1,1);
  delta3 = zeros(num_labels,1);
  % STEP 1
  mapped = zeros(1,num_labels);
  mapped(1,y(t)) = 1;
  % disp(size(X(i,:)))


  % Add bias unit AFTER sigmoid 
  z2 = Xcol(t,:)*Theta1';
  a = [1 sigmoid(z2)];
  z3 = a*Theta2';
  h = sigmoid(z3);

  % STEP 2
  for k = 1:num_labels
	delta3(k) = (h(k)-mapped(k));
  end
  
  % STEP 3
  delta2 = (Theta2'*delta3).*sigmoidGradient([1; z2']);


  
  % STEP 4
  % delta2(1,:) = 0;
  delta2 = delta2(2:end);
  capdelta1 = capdelta1+delta2*Xcol(t,:);
  capdelta2 = capdelta2+delta3*a;

end






% X a1				5000	x	400
% a a2	    		1	 	x	26
% h(x)				1		x	10
% delta2	 		25	 	x	1
% delta3	 		10	 	x	1
% capdelta1	 		25  	x	401
% capdelta2  		10	 	x	26
% Xcol 		 		5000	x	401



% STEP 5

for i = 1:size(capdelta1,1)
  D1(i,1) = (capdelta1(i,1)/m);
end
for i = 1:size(capdelta1,1)
  for j = 2:size(capdelta1,2)
    D1(i,j) = (capdelta1(i,j)/m)+((lambda/m).*Theta1(i,j));
  end
end

for i = 1:size(capdelta2,1)
  D2(i,1) = (capdelta2(i,1)/m);
end
for i = 1:size(capdelta2,1)
  for j = 2:size(capdelta2,2)
    D2(i,j) = (capdelta2(i,j)/m)+((lambda/m).*Theta2(i,j));
  end
end

Theta1_grad = D1;
Theta2_grad = D2;



% 4wJURrUYA4QbvQvQ










% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
