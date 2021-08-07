function intensity = inputImg()
close;
[x,y] = ginput;
hold on;

points = [x'; y'];

i = [0.025:0.05:0.975];
j = [0.025:0.05:0.975];

ij = zeros(2,length(i)*length(i));

intensity = zeros(20,20);

for k = 1:length(i)
  for l = 1:length(j)
    ij(:,20*k+l) = [i(k); j(l)];
  end
end

ij = ij(:,21:end);
for m = 1:length(points)
  for n = 1:length(ij)
    if distance(points(1,m),points(2,m),ij(1,n),ij(2,n)) < .075
	  [xpt,ypt] = dec2pts(n);
	  intensity(xpt,ypt) = 1;
	end
  end	
end
intensity = intensity';
map = [1 1 1;1 1 1; 1 1 1;0.5 0.5 0.5;0 0 0];
colormap(map);
h = imagesc(intensity, [0 1]);
intensity = flipud(intensity);
for i = 1:size(intensity,1)
  for j = 1:size(intensity,2)
    if intensity(i,j) == 0
	  intensity(i,j) = 8;
	end
	if intensity(i,j) == 1
	  intensity(i,j) = 1;
	end
  end
end
disp(intensity)