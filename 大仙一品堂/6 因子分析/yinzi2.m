%--------------------------------------------------------------------------
%%   读取数据，进行因子分析
%--------------------------------------------------------------------------

%% *读取数据********
[X,textdata] = xlsread('examp12_02.xls');    % 从Excel文件中读取数据
X = X(:,3:end);    % 提取X的第3至最后一列，即要分析的数据
varname = textdata(4,3:end);  %提取textdata的第4行，第3至最后一列，即变量名
obsname = textdata(5:end,2);  %提取textdata的第2列，第5至最后一行，即国家或地区名


%% 调用factoran函数根据原始观测数据作因子分析**
% 从原始数据（实质还是相关系数矩阵）出发，进行因子分析，公共因子数为4
% 进行因子旋转(最大方差旋转法)
[lambda,psi,T,stats] = factoran(X,4)
Contribut = 100*sum(lambda.^2)/8    %计算贡献率，因子载荷阵的列元素之和除以维数
CumCont = cumsum(Contribut)    %计算累积贡献率

[lambda,psi,T,stats,F] = factoran(X, 2)
Contribut = 100*sum(lambda.^2)/8    %计算贡献率，因子载荷阵的列元素之和除以维数
CumCont = cumsum(Contribut)    %计算累积贡献率

[varname' num2cell(lambda)]

%% 将因子得分F分别按耐力因子得分和速度因子得分进行排序*
obsF = [obsname, num2cell(F)];    % 将国家和地区名与因子得分放在一个元胞数组中显示
F1 = sortrows(obsF, 2);    % 按耐力因子得分排序
F2 = sortrows(obsF, 3);    % 按速度因子得分排序
head = {'国家/地区','耐力因子','速度因子'};
result1 = [head; F1];    % 显示按耐力因子得分排序的结果
result2 = [head; F2];    % 显示按速度因子得分排序的结果

%%  绘制因子得分负值的散点图***
plot(-F(:,1),-F(:,2),'k.') ;    %作因子得分负值的散点图
xlabel('耐力因子得分（负值）');    %为X轴加标签
ylabel('速度因子得分（负值）');    %为Y轴加标签
box off ;    %去掉坐标系右上的边框
gname(obsname);    %交互式添加各散点的标注
