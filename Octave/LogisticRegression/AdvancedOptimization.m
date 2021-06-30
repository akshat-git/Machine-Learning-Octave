cd C:/03_DevTools/GitHub/Machine-Learning/Octave/LogisticRegression
load ex2data2.txt;
warning('off');

global m = size(ex2data2,1);
global n = size(ex2data2,2)-1;
onecol = ones(m,1);
x = ex2data2(:,1:n);
x = [onecol x];
global y = ex2data2(:,n+1);


theta = ones((2*n+1),1);
for i = 2:2*n+1
  x(:,i) = (x(:,i).-(range(x(:,i))/2))/mean(x(:,i));
end
global x = mapFeature(x(:,2),x(:,3))

lambda = 1;

options = optimset('GradObj','on','MaxIter',100);
initialTheta = zeros(2*n+1,1)
	[optTheta,functionVal,exitFlag] =fminunc(@(t)(costFunctionReg(t, x, y, lambda)),initialTheta,options);

thetamat = theta;
printf("\nOptimal Theta Values: \n")
for i = 1:length(thetamat)
	printf(["\tTheta " int2str(i-1) ": " num2str(thetamat(i)) " \n"])
end

