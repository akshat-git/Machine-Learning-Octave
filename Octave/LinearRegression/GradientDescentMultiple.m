cd C:/03_DevTools/GitHub/Octave
load ex1data2.txt;
warning('off');
global m = size(ex1data2,1);
global n = 2%size(ex1data2,2)-1;
onecol = ones(m,1);
x = ex1data2(:,1:n)
x = [onecol x];
global y = ex1data2(:,3);


theta = ones((n+1),1)*50;

for i = 1:n
  x(:,i+1) = (x(:,i+1).-(range(x(:,i+1))/2))/mean(x(:,i+1));
end

global x = [x];

function change = step (theta, a, xnum)
  global x;
  global m;
  global n;
  global y;
  diff = (x*[theta])-y;
  for i = 1:m
	diff(i) = diff(i)*x(i,xnum+1);
  end
  change = sum(diff)*a/m; 
endfunction

alpha = 0.0000000001;
temp = ones((n+1),1);
iterations = ones(1,2);
change = 100;
i = 1
while change>1
  for j = 1:(n+1)
    temp(j) = theta(j)-step(theta,alpha,j-1);
  end
  change = J(theta)-J(temp)
  i = i+1;
  iterations = [iterations;i J(temp)];
  for j = 1:(n+1)
    theta(j) = temp(j);
  end
end

thetamat = theta
for i = 1:length(thetamat)
	print(["	Theta " int2str(i) ": " num2str(thetamat(i)) " \n"])
end


iterations(1,:) = [];
printf(["\n\t" int2str(CommaFormat(length(iterations(:,1)))) " ITERATIONS COMPLETED. \n \n"])

iterationgraph = plot(iterations(:,1),iterations(:,2),'r')
print -dpng 'MinimizationGradientDescent.png'

