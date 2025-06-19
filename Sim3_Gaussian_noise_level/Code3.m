clc
% clear all
close all
warning off





%% 数据处理
sample = 0.001; % 采样周期
size_data = 10/sample; % unit/s
t           = (0:1:size_data)*sample;
start_point = 1;

%% 画图配置
figure1 = figure();
figure1.Renderer = 'Painters';
set(gcf,'unit','centimeters','position',[20,0,26,16])
set(gcf,'PaperType','a3')
set(gca,'LooseInset',get(gca,'TightInset'))  % 出一张图
C1=[0,114,189]./255; % MATLAB 自带 蓝
C2=[237 177 32]./255; % MATLAB 自带 橙
C3=[217 83 25]./255; % MATLAB 自带 红
C4=[119,172,48]./255; % 浅绿
C5=[126 47 142]./255; % 紫色
%% 画图 y 低等噪声
% 驱动量
ESO1_y = ScopeData1_6(:,3);
ESO2_y = ScopeData1_6(:,4);
DCESO_y = ScopeData1_6(:,5);
GPIO_y = ScopeData1_6(:,6);
DO_y = ScopeData1_6(:,7);


ESO1_y      = ESO1_y(start_point:start_point+size_data);
ESO2_y      = ESO2_y(start_point:start_point+size_data);
DCESO_y      = DCESO_y(start_point:start_point+size_data);
GPIO_y      = GPIO_y(start_point:start_point+size_data);
DO_y      = DO_y(start_point:start_point+size_data);

subplot(2, 3, 1);
plot(t, DO_y,'color',C5);
hold on;
plot(t, ESO2_y,'color',C1);
hold on;
plot(t, ESO1_y,'color',C2);
hold on;
plot(t, GPIO_y,'color',C4);
hold on;
plot(t, DCESO_y,'color',C3);
hold on;

grid on;
ylabel('Driving voltage/v');
xlabel('Time/s');
title('(a)')
h_plot=legend('DO $Q_{cut} =10Hz$','ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','GPIO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'NumColumns',1);
set(h_plot,'Interpreter','latex')


%% 画图 y 中等噪声
% 驱动量
ESO1_y = ScopeData1(:,3);
ESO2_y = ScopeData1(:,4);
DCESO_y = ScopeData1(:,5);
GPIO_y = ScopeData1(:,6);
DO_y = ScopeData1(:,7);


ESO1_y      = ESO1_y(start_point:start_point+size_data);
ESO2_y      = ESO2_y(start_point:start_point+size_data);
DCESO_y      = DCESO_y(start_point:start_point+size_data);
GPIO_y      = GPIO_y(start_point:start_point+size_data);
DO_y      = DO_y(start_point:start_point+size_data);

subplot(2, 3, 2);
plot(t, DO_y,'color',C5);
hold on;
plot(t, ESO2_y,'color',C1);
hold on;
plot(t, ESO1_y,'color',C2);
hold on;
plot(t, GPIO_y,'color',C4);
hold on;
plot(t, DCESO_y,'color',C3);
hold on;

grid on;
ylabel('Driving voltage/v');
xlabel('Time/s');
title('(b)')
h_plot=legend('DO $Q_{cut} =10Hz$','ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','GPIO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'NumColumns',1);
set(h_plot,'Interpreter','latex')

%% 画图 y 高等噪声
% 驱动量
ESO1_y = ScopeData1_7(:,3);
ESO2_y = ScopeData1_7(:,4);
DCESO_y = ScopeData1_7(:,5);
GPIO_y = ScopeData1_7(:,6);
DO_y = ScopeData1_7(:,7);


ESO1_y      = ESO1_y(start_point:start_point+size_data);
ESO2_y      = ESO2_y(start_point:start_point+size_data);
DCESO_y      = DCESO_y(start_point:start_point+size_data);
GPIO_y      = GPIO_y(start_point:start_point+size_data);
DO_y      = DO_y(start_point:start_point+size_data);

subplot(2, 3, 3);
plot(t, DO_y,'color',C5);
hold on;
plot(t, ESO2_y,'color',C1);
hold on;
plot(t, ESO1_y,'color',C2);
hold on;
plot(t, GPIO_y,'color',C4);
hold on;
plot(t, DCESO_y,'color',C3);
hold on;

grid on;
ylabel('Driving voltage/v');
xlabel('Time/s');
title('(c)')
h_plot=legend('DO $Q_{cut} =10Hz$','ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','GPIO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'NumColumns',1);
set(h_plot,'Interpreter','latex')

%% 画图 u 低等噪声
% 驱动量
ESO1_u = ScopeData_u6(:,3);
ESO2_u = ScopeData_u6(:,4);
DCESO_u = ScopeData_u6(:,5);
GPIO_u = ScopeData_u6(:,6);
DO_u = ScopeData_u6(:,7);


ESO1_u      = ESO1_u(start_point:start_point+size_data);
ESO2_u      = ESO2_u(start_point:start_point+size_data);
DCESO_u      = DCESO_u(start_point:start_point+size_data);
GPIO_u      = GPIO_u(start_point:start_point+size_data);
DO_u      = DO_u(start_point:start_point+size_data);

subplot(2, 3, 4);
plot(t, DO_u,'color',C5);
hold on;
plot(t, ESO2_u,'color',C1);
hold on;
plot(t, ESO1_u,'color',C2);
hold on;
plot(t, GPIO_u,'color',C4);
hold on;
plot(t, DCESO_u,'color',C3);
hold on;

grid on;
ylabel('Driving voltage/v');
xlabel('Time/s');
title('(d)')
h_plot=legend('DO $Q_{cut} =10Hz$','ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','GPIO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'NumColumns',1);
set(h_plot,'Interpreter','latex')
ylim([-2.1 3])

% % 只需要这两行代码就可以绘制局部放大图
% zp = BaseZoom();
% zp.plot;

%% 画图 u 中等噪声
% 驱动量
ESO1_u = ScopeData_u(:,3);
ESO2_u = ScopeData_u(:,4);
DCESO_u = ScopeData_u(:,5);
GPIO_u = ScopeData_u(:,6);
DO_u = ScopeData_u(:,7);

ESO1_u      = ESO1_u(start_point:start_point+size_data);
ESO2_u      = ESO2_u(start_point:start_point+size_data);
DCESO_u      = DCESO_u(start_point:start_point+size_data);
GPIO_u      = GPIO_u(start_point:start_point+size_data);
DO_u      = DO_u(start_point:start_point+size_data);

subplot(2, 3, 5);
plot(t, DO_u,'color',C5);
hold on;
plot(t, ESO2_u,'color',C1);
hold on;
plot(t, ESO1_u,'color',C2);
hold on;
plot(t, GPIO_u,'color',C4);
hold on;
plot(t, DCESO_u,'color',C3);
hold on;

grid on;
ylabel('Driving voltage/v');
xlabel('Time/s');
title('(e)')
h_plot=legend('DO $Q_{cut} =10Hz$','ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','GPIO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'NumColumns',1);
set(h_plot,'Interpreter','latex')
ylim([-2.2 3])

%% 画图 u 高等噪声
% 驱动量
ESO1_u = ScopeData_u7(:,3);
ESO2_u = ScopeData_u7(:,4);
DCESO_u = ScopeData_u7(:,5);
GPIO_u = ScopeData_u7(:,6);
DO_u = ScopeData_u7(:,7);

ESO1_u      = ESO1_u(start_point:start_point+size_data);
ESO2_u      = ESO2_u(start_point:start_point+size_data);
DCESO_u      = DCESO_u(start_point:start_point+size_data);
GPIO_u      = GPIO_u(start_point:start_point+size_data);
DO_u      = DO_u(start_point:start_point+size_data);

subplot(2, 3, 6);
plot(t, DO_u,'color',C5);
hold on;
plot(t, ESO2_u,'color',C1);
hold on;
plot(t, ESO1_u,'color',C2);
hold on;
plot(t, GPIO_u,'color',C4);
hold on;
plot(t, DCESO_u,'color',C3);
hold on;

grid on;
ylabel('Driving voltage/v');
xlabel('Time/s');
title('(f)')
h_plot=legend('DO $Q_{cut} =10Hz$','ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','GPIO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'NumColumns',1);
set(h_plot,'Interpreter','latex')
ylim([-3.7 4.5])



% 出图
% exportgraphics(figure1,['./Fig-Sim3B','.pdf'],'ContentType','vector');