function [jval,gradient] = costFunction(theta)
	global x;
	global y;
	global m;
	global n;
	diff = zeros(m,1)
	for i = 1:m
	  diff(i) = y(i)*log10(g(x*theta))+(1-y(i))*log10(1-g(x*theta))
	end
	jval =(sum(diff))/m;
	gradient = zeros(n+1,1)
	errors = zeros(1,n+1)
	x*theta
	gradient = x'*(g(x*theta)-y)/m
endfunction