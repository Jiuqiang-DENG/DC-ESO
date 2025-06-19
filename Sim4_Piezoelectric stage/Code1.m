clc
clear all
close all
warning off

s       = tf('s');


G2 = (100) / (s^2+s+100); % piezoelectric stage
b0 = 100;

[num_G2,den_G2] = tfdata(G2);
num_G2 = num_G2{1,1};
den_G2 = den_G2{1,1};
