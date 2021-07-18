% Law of Sines

choice = menu("Given", {"SSA","SAA"})
if choice == 1
	a = input("Side a: ");
	b = input("Side b: ");
	beta = deg2rad(input("Angle β"));

	output = rad2deg(asin(a*sin(beta)/b))

if choice == 2
	a = input("Side a: ");
	alpha = deg2rad(input("Angle α"));
	beta = deg2rad(input("Angle β"));

	output = rad2deg(a*sin(beta)/sin(alpha))