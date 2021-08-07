intensity = inputImg()

theta1 = load("Theta1.mat");
theta2 = load("Theta2.mat");

hypothesis = predict(theta1.Theta1,theta2.Theta2,intensity(:)')