
%%  学习目标： 从相关系数矩阵出发进行因子分析
%%    QQ：1960009019
%%   更多matlab精彩专题课程和案例，可以搜索微信公众号：大仙一品堂
%%  定义相关系数矩阵PHO**
PHO = [1     0.79    0.36    0.76    0.25    0.51
          0.79  1       0.31    0.55    0.17    0.35
          0.36  0.31    1       0.35    0.64    0.58
          0.76  0.55    0.35    1       0.16    0.38
          0.25  0.17    0.64    0.16    1       0.63
          0.51  0.35    0.58    0.38    0.63    1
          ];

%% 调用factoran函数根据相关系数矩阵作因子分析
% 从相关系数矩阵出发，进行因子分析，公共因子数为2，设置特殊方差的下限为0，
% 不进行因子旋转
[lambda,psi,T] = factoran(PHO,2,'xtype','covariance','delta',0,'rotate','none')


% 定义元胞数组，以元胞数组形式显示结果
% 表头
head = {'变量', '因子f1', '因子f2'};
% 变量名
varname = {'身高','坐高','胸围','手臂长','肋围','腰围','<贡献率>','<累积贡献率>'}';
Contribut = 100*sum(lambda.^2)/6;    % 计算贡献率，因子载荷阵的列元素之和除以维数
CumCont = cumsum(Contribut);    % 计算累积贡献率
% 将因子载荷阵，贡献率和累积贡献率放在一起，转为元胞数组
result1 = num2cell([lambda; Contribut; CumCont]);
% 加上表头和变量名，然后显示结果
result1 = [head; varname, result1]



[lambda,psi,T] =factoran(PHO,2,'xtype','covariance','delta',0)
Contribut = 100*sum(lambda.^2)/6    %计算贡献率，因子载荷阵的列元素之和除以维数
CumCont = cumsum(Contribut)    %计算累积贡献率



[lambda,psi,T] = factoran(PHO,3,'xtype','covariance','delta',0)
Contribut = 100*sum(lambda.^2)/6    % 计算贡献率，因子载荷阵的列元素之和除以维数
CumCont = cumsum(Contribut)    % 计算累积贡献率
