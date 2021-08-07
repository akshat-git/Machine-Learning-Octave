warning('off')
close;

load("Theta1.mat");
load("Theta2.mat");
intensity = imgInput;
p = predict(Theta1,Theta2,intensity(:)');
disp(["Image Processed as " int2str(p)])

ex4data1 = reader("ex4data1.mat");

save "train.mat" ex4data1