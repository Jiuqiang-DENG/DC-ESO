clc
% clear all
close all
warning off

%% 读数据
% 跟踪数据
ref = ScopeData1(:,2);
ESO1_y = ScopeData1(:,3);
ESO2_y = ScopeData1(:,4);
DCESO_y = ScopeData1(:,5);
GPIO_y = ScopeData1(:,6);
DO_y = ScopeData1(:,7);

% 驱动量
ESO1_u = ScopeData_u(:,3);
ESO2_u = ScopeData_u(:,4);
DCESO_u = ScopeData_u(:,5);
GPIO_u = ScopeData_u(:,6);
DO_u = ScopeData_u(:,7);

% 扰动数据
dis = ScopeData_dis(:,2);
ESO1_dis_er = ScopeData_dis(:,3);
ESO2_dis_er = ScopeData_dis(:,4);
DCESO_dis_er = ScopeData_dis(:,5);
GPIO_dis_er = ScopeData_dis(:,6);
DO_dis_er = ScopeData_dis(:,7);

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

%% 画图 施加扰动
dis      = dis(start_point:start_point+size_data);

subplot(2, 2, 1);
plot(t, dis,'g');
hold on;
grid on;
ylabel('Pos/deg');
xlabel('Time/s');
h_plot=legend('$dis(t)$','NumColumns',1);
set(h_plot,'Interpreter','latex')
title('(a)')
% ylim([-1.3 2.4])

%% 画图 输入输出
ref      = ref(start_point:start_point+size_data);
ESO1_y      = ESO1_y(start_point:start_point+size_data);
ESO2_y      = ESO2_y(start_point:start_point+size_data);
DCESO_y      = DCESO_y(start_point:start_point+size_data);
GPIO_y 	= GPIO_y(start_point:start_point+size_data);
DO_y 	= DO_y(start_point:start_point+size_data);

subplot(2, 2, 2);
plot(t, ESO2_y,'color',C1);
hold on;
plot(t, ESO1_y,'color',C2);
hold on;
plot(t, DCESO_y,'color',C3);
hold on;
plot(t, GPIO_y,'color',C4);
hold on;
plot(t, DO_y,'color',C5);
hold on;
grid on;
ylabel('Pos/deg');
xlabel('Time/s');
h_plot=legend('$y(t)$ ESO  $\omega_o =20Hz$','$y(t)$ ESO $\omega_o =10Hz$','$y(t)$ DC-ESO $\omega_o =10Hz$',...
    '$y(t)$ GPIO $\omega_o =10Hz$','$y(t)$ DO $Q_{cut} =10Hz$','$r(t)$','NumColumns',1);
set(h_plot,'Interpreter','latex')
title('(b)')
% ylim([-0.01 0.04])


% zp = BaseZoom();
% zp.plot;


%% 画图 扰动估计误差
ESO1_dis_er      = ESO1_dis_er(start_point:start_point+size_data);
ESO2_dis_er      = ESO2_dis_er(start_point:start_point+size_data);
DCESO_dis_er      = DCESO_dis_er(start_point:start_point+size_data);
GPIO_dis_er      = GPIO_dis_er(start_point:start_point+size_data);
DO_dis_er      = DO_dis_er(start_point:start_point+size_data);

subplot(2, 2, 3);
plot(t, ESO2_dis_er,'color',C1);
hold on;
plot(t, ESO1_dis_er,'color',C2);
hold on;
plot(t, DCESO_dis_er,'color',C3);
hold on;
plot(t, GPIO_dis_er,'color',C4);
hold on;
plot(t, DO_dis_er,'color',C5);
hold on;
grid on;
% ylabel('Estimating error');
xlabel('Time/s');
title('(c)')
h_plot=legend('ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'GPIO $\omega_o =10Hz$','DO $Q_{cut} =10Hz$','NumColumns',1);
set(h_plot,'Interpreter','latex')


% zp = BaseZoom();
% zp.plot;

%% 画图 u
ESO1_u      = ESO1_u(start_point:start_point+size_data);
ESO2_u      = ESO2_u(start_point:start_point+size_data);
DCESO_u      = DCESO_u(start_point:start_point+size_data);
GPIO_u      = GPIO_u(start_point:start_point+size_data);
DO_u      = DO_u(start_point:start_point+size_data);

data2 = ESO1_u;
data1 = ESO2_u;
data3 = DCESO_u;
data4 = GPIO_u;
data5 = DO_u;
fs = 1000;              % 采样频率

subplot(2, 2, 4);
hold on;
colors = [C1;C2;C3;C4;C5];

% 每段数据显示4秒
segment_duration = 0.6; % 每段显示时间（秒）
for i = 1:5

    start_time = (i-1) * segment_duration;
    end_time = start_time + segment_duration;
    start_idx = round(start_time * fs) + 1;
    end_idx = round(end_time * fs) + 1;
    

    switch i
        case 1, current_data = data1;
        case 2, current_data = data2;
        case 3, current_data = data3;
        case 4, current_data = data4;
        case 5, current_data = data5;
    end
    

    plot(t(start_idx:end_idx), current_data(start_idx:end_idx), ...
        'Color', colors(i,:));
end


start_idx = round(segment_duration*5 * fs) + 1;
end_idx = length(t);
plot(t(start_idx:end_idx), data1(start_idx:end_idx), 'Color', colors(1,:));
plot(t(start_idx:end_idx), data2(start_idx:end_idx), 'Color', colors(2,:));
plot(t(start_idx:end_idx), data3(start_idx:end_idx), 'Color', colors(3,:));
plot(t(start_idx:end_idx), data4(start_idx:end_idx), 'Color', colors(4,:));
plot(t(start_idx:end_idx), data5(start_idx:end_idx), 'Color', colors(5,:));


hold on;
grid on;
ylabel('Driving voltage/v');
xlabel('Time/s');
title('(d)')
h_plot=legend('ESO  $\omega_o =20Hz$',' ESO $\omega_o =10Hz$','DC-ESO $\omega_o =10Hz$',...
    'GPIO $\omega_o =10Hz$','DO $Q_{cut} =10Hz$','NumColumns',1);
set(h_plot,'Interpreter','latex')
ylim([-2.1 3])


% zp = BaseZoom();
% zp.plot;

rms_ESO2_dis_er = rms(ESO2_dis_er)
rms_ESO1_dis_er = rms(ESO1_dis_er)
rms_DCESO_dis_er = rms(DCESO_dis_er)

exportgraphics(figure1,['./Fig-Sim1','.pdf'],'ContentType','vector');


