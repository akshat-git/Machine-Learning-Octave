% SAS
a = input("Side a: ");
b = input("Side b: ");
gamma = deg2rad(input("Angle gamma: "));
output = abs(sqrt((a*a)+(b*b)-(2*a*b*cos(gamma))))