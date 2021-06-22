cd C:/03_DevTools/Octave
load ex1data2.txt
global m = size(ex1data2,1);
global n = size(ex1data2,2)-1;
onecol = ones(m,1);
x = [onecol ex1data2(:, 1)];
global y = ex1data2(:,3);

x0 = x(:,1)
x1 = x(:,2)

x1avg = mean(x1);
x1 = (x1.-(range(x1)/2))/x1avg;

global x = [x0 x1]

function change = step (theta0, theta1, a, xnum)
  global x;
  global m;
  global n;
  global y;
  diff = (x*[theta0;theta1])-y;
  for i = 1:m
	diff(i) = diff(i)*x(i,xnum+1);
  end
  change = sum(diff)*a/m; 
endfunction

function cost = J (theta0, theta1)
  global x;
  global m;
  global n;
  global y;
  diff = ((x*[theta0;theta1])-y).^2;
  cost = sum(diff)/(2*m)
endfunction

alpha = 0.000000003
temp0 = 1
temp1 = 1;
iterations = [1 1]
theta0 = 50
theta1 = 50
change = 1
while change<=500
  temp0 = theta0-step(theta0,theta1,alpha,0);
  temp1 = theta1-step(theta0,theta1,alpha,1);
  change = change+1 %J(theta0,theta1)-J(temp0,temp1)
  iterations = [iterations;i J(temp0, temp1)];
  theta0 = temp0;
  theta1 = temp1;
end
iterations(1,:) = [];
size(iterations)
iterationgraph = plot(iterations(:,1),iterations(:,2))
