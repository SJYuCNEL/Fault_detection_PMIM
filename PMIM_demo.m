%      File:    <Interpretable Fault Detection using Projections of Mutual Information Matrix>
%   Authors:    <Shujian Yu (yusjlcy9011@ufl.edu,Shujian.Yu@neclab.eu),Department of Electrical and Computer Engineering, University of Florida, Gainesville, FL 32611, USA> 
%               <Feiya Lv (lvfeiya0215@126.com),School of Software Engineering, Anyang Normal University, Anyang 455000, PR China>
%               <Chenglin Wen(wencl@hdu.edu.cn),School of Automation, Hangzhou Dianzi University, Hangzhou 310018, PR China>
%               <Jose C. Principe (principe@cnel.ufl.edu),Department of Electrical and Computer Engineering, University of Florida, Gainesville, FL 32611, USA>              
%    WEBSITE:    https://github.com/SJYuCNEL/Fault_detection_PMIM.htm
%    Journal:    Journal of The Franklin Institute, 2021
%       DATE:    Feb., 2021     
% Copyright (c) <2020>, All rights reserved.  
% 
%THIS HEADER MAY NOT BE EXTRACTED OR MODIFIED IN ANY WAY.  
%      PROPRIETARY INFORMATION ---   
%      ACADEMIC OR NON-PROFIT ORGANIZATION NONCOMMERCIAL RESEARCH USE ONLY
% 
% BY USING OR DOWNLOADING THE CODE, YOU ARE AGREEING TO THE TERMS OF THIS
% LICENSE AGREEMENT.  IF YOU DO NOT AGREE WITH THESE TERMS, YOU MAY NOT USE OR
% DOWNLOAD THE SOFTWARE.
% 
%        THIS HEADER MAY NOT BE EXTRACTED OR MODIFIED IN ANY WAY.

%% ===================================================================
clear,clc
%  MI estimation using matrix-based Renyi definition
addpath(genpath('Renyi entropy'))
sigma = 0.5;
alpha = 1.001;
MIsize=100;
% ---------------------training data-------------- 
load sd00_tr_long.dat;
X=sd00_tr_long;
[nums_train nums_vars]=size(X); 
[trainData, av, st]=zscore(X);  
RMI00 = MI_matrix(trainData,sigma,alpha,MIsize)
Di = MITCSA(trainData,RMI00,MIsize)




