% Law of Cosines

choice = menu("Given", {"SSS","SAS"})
if choice == 1
	a = input("Side a: ");
	b = input("Side b: ");
	c = input("Side c: ");

	output = rad2deg(acos((a*a+b*b-c*c)/(2*a*b)))

if choice == 2
	a = input("Side a: ");
	b = input("Side a: ");
	gamma = deg2rad(input("Angle γ"));

	output = rad2deg(sqrt(abs(a*a+b*b-2*a*b*cos(gamma))))