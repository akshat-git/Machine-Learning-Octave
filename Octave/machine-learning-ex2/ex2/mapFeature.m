function out = mapFeature(X1, X2)
degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
		disp(["X1:" int2str(i-j) "  X2:" int2str(j)])
    end
end

end

% X1.1+ 1.X2 + X1^2.1 + X1^1.X2 