clc
clear all
close all
warning off


%-------------------Object--------------------
s       = tf('s');
tao1    =   1/1000;
tao2    =   10e-6; 
taoP = tao1 + tao2;
Delay = exp(-taoP*s);
K_obj       = 80;
gobj   = K_obj/(s);      
wn1 = 2*pi*267;
ebs1 = 0.008;
res1 = (wn1^2)/(s^2+2*ebs1*wn1*s+wn1^2); 
wn2 = 2*pi*69;
ebs2 = (wn2/wn1)*ebs1;
res2 = (s^2+2*ebs2*wn2*s+wn2^2)/(wn2^2); 
G1        = gobj*res1*res2*Delay*1*1*1;                            % 需要绘图的传递函数


JS  = 1/K_obj
JM  = (wn2/wn1)^2*JS
JF  = JS - JM
JP  = (JM*JF)/(JM+JF);

K2  = wn2^2 * JF;
K1  = wn1^2 * JP;
C2  = 2*ebs2/wn2*K2;
C1  = 2*ebs1/wn1*K1;


K_fit   = K1
C_fit   = C1

G2 = (s^2*JF + C_fit*s + K_fit) / ((s^1*JS)*(s^2*JP + C_fit*s + K_fit));


GV = G2;
[num_GV,den_GV] = tfdata(GV);
num_GV = num_GV{1,1};
den_GV = den_GV{1,1};
