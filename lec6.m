%% homeWork6 多项式回归
% 编程实现对美国人口普查数据的多项式回归，拟合阶数为1到5阶。要求：将多项式回归问题
% 转换为高斯消去法解线性代数方程组

clc; clear all; close all;
t = [1900;1910;1920;1930;1940;1950;1960;1970;1980;1990;2000];
y = [75.995;91.972;105.711;123.203;131.669;150.697;179.323;203.212;226.505;249.633;281.422];

figure(1);
hold on;
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,y,'LineWidth',1.5);
title('美国人口普查数据');xlabel('t');ylabel('y');grid on;

%% 对于不同的阶数的多项式进行回归求解关键在于构造矩阵

%% 1阶
x1 = [ones(length(t),1),t];
a1 = solveMatrix(x1.'*x1,x1.'*y);
%直接用右除，比较计算结果
a1_1 = (x1.'*x1)\(x1.'*y);


%绘制图像：
f1 = @(t)a1(2)*t + a1(1);
figure(2);
hold on;
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,f1(t),'LineWidth',1.5);
title('1阶拟合');xlabel('t');ylabel('y');grid on;

figure(3)
hold on;
%利用cftool工具箱进行拟合
p1 = polyfit(t,y,1);
fp1 = @(t)p1(1)*t + p1(2); 
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,fp1(t),'LineWidth',1.5);
title('polyfit-1阶拟合');xlabel('t');ylabel('y');grid on;

%% 2阶

x2 = [ones(length(t),1),t,t.^2];
a2 = solveMatrix(x2.'*x2,x2.'*y);
%直接用右除，比较计算结果
a2_1 = (x2.'*x2)\(x2.'*y);

%绘制图像：
f2 = @(t)a2(3)*t.^2 + a2(2)*t + a2(1);
figure(4);
hold on;
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,f2(t),'LineWidth',1.5);
title('2阶拟合');xlabel('t');ylabel('y');grid on;

p2 = polyfit(t,y,2);
fp2 = @(t)p2(1)*t.^2 + p2(2)*t + p2(3); 
figure(5)
hold on;
%利用polyfit进行拟合
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,fp2(t),'LineWidth',1.5);
title('polyfit-2阶拟合');xlabel('t');ylabel('y');grid on;

%% 3阶

x3 = [ones(length(t),1),t,t.^2,t.^3];
a3 = solveMatrix(x3.'*x3,x3.'*y);
%直接用右除，比较计算结果
a3_1 = (x3.'*x3)\(x3.'*y);

%绘制图像：
f3 = @(t)a3(4)*t.^3 + a3(3)*t.^2 + a3(2)*t + a3(1);
figure(6);
hold on;
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,f3(t),'LineWidth',1.5);
title('3阶拟合');xlabel('t');ylabel('y');grid on;

figure(7)
hold on;
%利用polyfit进行拟合
p3 = polyfit(t,y,3);
fp3 = @(t)p3(1)*t.^3 + p3(2)*t.^2 + p3(3)*t + p3(4); 
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,fp3(t),'LineWidth',1.5);
title('polyfit-3阶拟合');xlabel('t');ylabel('y');grid on;

%% 4阶

x4 = [ones(length(t),1),t,t.^2,t.^3,t.^4];
a4 = solveMatrix(x4.'*x4,x4.'*y);
%直接用右除，比较计算结果
a4_1 = (x4.'*x4)\(x4.'*y);

%绘制图像：
f4 = @(t)a4(5)*t.^4 + a4(4)*t.^3 + a4(3)*t.^2 + a4(2)*t + a4(1);
figure(8);
hold on;
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,f4(t),'LineWidth',1.5);
title('4阶拟合');xlabel('t');ylabel('y');grid on;

figure(9)
hold on;
%利用polyfit进行拟合
p4 = polyfit(t,y,4);
fp4 = @(t)p4(1)*t.^4 + p4(2)*t.^3 + p4(3)*t.^2 + p4(4)*t + p4(5); 
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,fp4(t),'LineWidth',1.5);
title('polyfit-4阶拟合');xlabel('t');ylabel('y');grid on;

%% 5阶

x5 = [ones(length(t),1),t,t.^2,t.^3,t.^4,t.^5];
a5 = solveMatrix(x5.'*x5,x5.'*y);
%直接用右除，比较计算结果
a5_1 = (x5.'*x5)\(x5.'*y);

%绘制图像：
f5 = @(t)a5(6)*t.^5 + a5(5)*t.^4 + a5(4)*t.^3 + a5(3)*t.^2 + a5(2)*t + a5(1);
figure(10);
hold on;
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,f5(t),'LineWidth',1.5);
title('5阶拟合');xlabel('t');ylabel('y');grid on;

figure(11)
hold on;
%利用polyfit进行拟合
p5 = polyfit(t,y,5);
fp5 = @(t)p5(1)*t.^5 + p5(2)*t.^4 + p5(3)*t.^3 + p5(4)*t.^2 + p5(5)*t + p5(6); 
plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
plot(t,fp5(t),'LineWidth',1.5);
title('polyfit-5阶拟合');xlabel('t');ylabel('y');grid on;
% %% 6阶
% 
% x6 = [ones(length(t),1),t,t.^2,t.^3,t.^4,t.^5,t.^6];
% a6 = solveMatrix(x6.'*x6,x6.'*y);
% disp('高斯消去6阶拟合函数系数');
% disp(double(a6));
% %直接用右除，比较计算结果
% a6_1 = (x6.'*x6)\(x6.'*y);
% disp('直接右除6阶拟合函数系数');
% disp(double(a6_1));
% 
% %绘制图像：
% f6 = @(t)a6(7)*t.^6+a6(6)*t.^5 + a6(5)*t.^4 + a6(4)*t.^3 + a6(3)*t.^2 + a6(2)*t + a6(1);
% figure(12);
% hold on;
% plot(t,y,'r^','MarkerFaceColor',[1,0,0],'MarkerSize',8);
% plot(t,f6(t),'LineWidth',1.5);
% title('6阶拟合');xlabel('t');ylabel('y');grid on;
