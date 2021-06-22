cd C:/03_DevTools/GitHub/Octave
load ex1data2.txt;
warning('off');
global m = size(ex1data2,1);
global n = 1%size(ex1data2,2)-1;
onecol = ones(m,1);
x = ex1data2(:,1:n);
x = [onecol x];
global y = ex1data2(:,3);

x0 = x(:,1);
x1 = x(:,2);

theta = ones((n+1),1)*50;

x1avg = mean(x1);
x1 = (x1.-(range(x1)/2))/x1avg;

global x = [x0 x1];

function change = step (theta, a, xnum)
  global x;
  global m;
  global n;
  global y;
  diff = (x*theta)-y;
  for i = 1:m
	diff(i) = diff(i)*x(i,xnum+1);
  end
  change = sum(diff)*a/m; 
endfunction

alpha = 0.000000001;
temp = ones((n+1),1);
iterations = ones(1,2);
change = 100;
i = 1;
maxim = (J(theta)*92/100)/100
while change>1
  for j = 1:(n+1)
    temp(j) = theta(j)-step(theta,alpha,j-1);
  end
  change = J(theta)-J(temp);
  disp([int2str(floor((10000/92*maxim-J(temp))/maxim)) "% complete"])
  i = i+1;
  iterations = [iterations;i J(temp)];
  for j = 1:(n+1)
    theta(j) = temp(j);
  end
end

thetamat = theta;
printf("\nOptimal Theta Values: \n")
for i = 1:length(thetamat)
	printf(["\tTheta " int2str(i-1) ": " num2str(thetamat(i)) " \n"])
end

% theta0_vals = linspace(-10, 10, 100);
% theta1_vals = linspace(-1, 4, 100);

% % initialize J_vals to a matrix of 0's
% J_vals = zeros(length(theta0_vals), length(theta1_vals));

% % Fill out J_vals
% for i = 1:length(theta0_vals)
    % for j = 1:length(theta1_vals)
	  % t = [theta0_vals(i); theta1_vals(j)];
	  % J_vals(i,j) = J(t);
    % end
% end

% J_vals = J_vals';

% bowl = surf(theta0_vals, theta1_vals, J_vals)
% xlabel('\theta_0'); ylabel('\theta_1');


% iterations(1,:) = [];
% printf(["\n\t" int2str(CommaFormat(length(iterations(:,1)))) " ITERATIONS COMPLETED. \n \n"])

% xaxis = [ones(length(y),1) linspace(0,max(x(:,2)),length(y))'];

% figure(1); plot(iterations(:,1),iterations(:,2),'r');
% close;

% figure(2); scatter(x(:,2:(n+1)),y,'g','c','filled'), hold on, plot(xaxis,xaxis*theta,'b');
% close;

% figure(3); surf(theta0_vals, theta1_vals, J_vals)
% close;

% clf;

% subplot(1,3,1,"position",get(0,"screensize"))
% iterationgraph = plot(iterations(:,1),iterations(:,2),'r');
% print -dpng 'MinimizationGradientDescent.png'
% hold on;
% axis ("square");
% xlabel('Iterations');
% ylabel('Cost Function');
% title("Cost Function Minimization")
% set(gca,'box','on');

% subplot(1,3,2,"position",get(0,"screensize"))
% regressionscat = scatter(x(:,2:(n+1)),y,15,'g','filled'), hold on, regressionlin = plot(xaxis(:,2:(n+1)),xaxis*theta,'b')
% print -dpng 'RegressionScatterPlot.png'
% axis ("square");
% xlabel('House Size');
% ylabel('House Price');
% title("Line of Best Fit")
% set(gca,'box','on');

% subplot(1,3,3,"position",get(0,"screensize"))
% bowl = surf(theta0_vals, theta1_vals, J_vals)
% hold on;
% xlabel('\theta_0'); ylabel('\theta_1');
% axis ("square");
% set(gca,'box','on');

