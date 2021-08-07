function [xpt,ypt] = dec2pts(m)
  ypt = mod(m+19,20)+1;
  xpt = floor(m/20)+1;
end
  
