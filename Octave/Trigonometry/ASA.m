% SAA
a = input("Side a: ");
gamma = deg2rad(input("Angle gamma: "));
beta = deg2rad(input("Angle beta: "));
alpha = 2*pi-gamma-beta;
b = abs(a*sin(beta)/sin(alpha))
c = abs(a*sin(gamma)/sin(alpha))