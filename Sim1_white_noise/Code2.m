clc
close all
warning off
%% par
b0=80;  

wo=10*2*pi;
wc=3*2*pi;
L1=3*wo;
L2=3*wo^2;
L3=wo^3;
L4_DCESO=6*2*pi;

%% DC-ESO
A_DC_ESO = [-L1 1 0 0;-L2 0 1 0;-L3 0 0 0;0 0 L4_DCESO/b0 0;];
B_DC_ESO = [0 L1;b0 L2;0 L3;0 0];
C_DC_ESO = eye(4);
D_DC_ESO = [0 0;0 0;0 0;0 0];

%% ---------------ESO--------------
A_ESO = [-L1 1 0;-L2 0 1;-L3 0 0];
B_ESO = [0 L1;b0 L2;0 L3];
C_ESO = eye(3);
D_ESO = [0 0;0 0;0 0];


%% ---------------ESO wo*2--------------
wo=wo*2; 
L1=3*wo;
L2=3*wo^2;
L3=wo^3;

A_ESO2 = [-L1 1 0;-L2 0 1;-L3 0 0];
B_ESO2 = [0 L1;b0 L2;0 L3];
C_ESO2 = eye(3);
D_ESO2 = [0 0;0 0;0 0];

%% GPIO
wo=wo/2; 
L1=4*wo;
L2=6*wo^2;
L3 = 4*wo^3;
L4=wo^4;
A_GPIO = [-L1 1 0 0;-L2 0 1 0;-L3 0 0 1; -L4 0 0 0];
B_GPIO = [0 L1;b0 L2;0 L3;0 L4];
C_GPIO = eye(4);
D_GPIO = [0 0;0 0;0 0;0 0];


%% DO
s       = tf('s');
G = b0 / s^2;

G_invse = 1/G * (1/(0.005*s+1))^2;
T = 1/(2*pi*10); % wo=10Hz
Q = 1/ (T*s+1);

[num_G_invse,den_G_invse] = tfdata(G_invse);
num_G_invse = num_G_invse{1,1};
den_G_invse = den_G_invse{1,1};
[num_Q,den_Q] = tfdata(Q);
num_Q = num_Q{1,1};
den_Q = den_Q{1,1};

%% ----------------------sim---------------------
sim('RF_KC_Time_AxisA4.slx');

