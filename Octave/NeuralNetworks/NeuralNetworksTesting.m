cd C:\03_DevTools\GitHub\Machine-learning\Octave\NeuralNetworks

global layers = [3 2 1];

x = ones(s(1),1);


z = ones(s(2)+1,length(layers)-2);
a = ones(size(z));
for j = 1:length(layers)-1
  theta.(["theta" int2str(j)]) = ones(s(j+1),s(j)+1);
end
theta.theta1 = [ 1 5.1 2.3; 1 -1.5 3.7];
z = theta.theta1*x
a = [1; g(z)];
y = 0;
theta.theta2 = [1 -0.8 0.6];
y = g(theta.theta2*a);
y
