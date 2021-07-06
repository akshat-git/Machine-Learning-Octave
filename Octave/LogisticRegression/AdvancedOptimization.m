cd C:/03_DevTools/GitHub/Machine-Learning/Octave/LogisticRegression
close all;

load ex2data2.txt;


warning('off');
global m = size(ex2data2,1);
onecol = ones(m,1);
x = ex2data2(:,1:2);
global y = ex2data2(:,size(ex2data2,2));
plotData(x,y)
pause;
x = mapFeature(x(:,1),x(:,2));
x = [onecol x];
global n = size(x, 2)-1;





for i = 2:n+1
  x(:,i) = (x(:,i).-(range(x(:,i))/2))/mean(x(:,i));
end

theta = zeros((n+1),1);
temp = zeros(size(theta))
lambda = 1;
i = 1
while i < 500
  [J, gradient] = costFunction(theta, x, y, lambda)
  for j = 1:length(temp)
  temp = theta-alpha*gradient
  theta = temp

%plotDecisionBoundary(theta, x, y);
%hold on;
%title(sprintf('lambda = %g', lambda))

thetamat = theta;
printf("\nOptimal Theta Values: \n")
for i = 1:length(thetamat)
	printf(["\tTheta " int2str(i-1) ": " num2str(thetamat(i)) " \n"])
end


