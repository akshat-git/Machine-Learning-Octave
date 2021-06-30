cd C:/03_DevTools/GitHub/Octave
load ex2data1.txt;
warning('off');
global m = size(ex2data1,1);
global n = 2%size(ex2data1,2)-1;
onecol = ones(m,1);
x = ex2data1(:,1:n);
x = [onecol x];
global y = ex2data1(:,n+1);


theta = ones((n+1),1)*50;
for i = 1:n
  x(:,i+1) = (x(:,i+1).-(range(x(:,i+1))/2))/mean(x(:,i+1));
end
global x = [x]

options = optimset('GradObj','on','MaxIter',100)
initialTheta = zeros(n+1,1)
	[optTheta,functionVal,exitFlag] =fminunc(@costFunction,initialTheta,options)

thetamat = theta;
printf("\nOptimal Theta Values: \n")
for i = 1:length(thetamat)
	printf(["\tTheta " int2str(i-1) ": " num2str(thetamat(i)) " \n"])
end

