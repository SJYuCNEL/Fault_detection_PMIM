%%
%  In the first example, we generate a very simple dependence: X1,X2,X3 are
%  normally distributed variables. Our target, X3, is a noisy observation
%  of X1. X2 is uncorrelated with either of them.
%
%       X1
%        \ 
%     X2  X3
clear,clc
nsamples      = 1000;
data          = zeros(nsamples,3);
data(:,[1 2]) = randn(nsamples,2);
data(:,3)    =  0.5*data(:,1) + 0.5*randn(nsamples,1);

%% data quantization
data_quant=quantize(data,'levels',5);

%% MI estimation using Shannon definition
addpath(genpath('Shannon entropy'))
CountsMat13 = CountsMat_generation(data_quant(:,1),data_quant(:,3));
%-------------------------------------------------------------------
% %CountsMat = CountsMat_generation(data1,data2)
% data1=data_quant(:,1);data2=data_quant(:,2);
% num_fea_states1 = numel(unique(data1));% unique returns the unique value by increasing orders
% num_fea_states2 = numel(unique(data2));% numel returns the number of elements
% CountsMat = zeros(num_fea_states1,num_fea_states2);
% for i=1:numel(data1)
%     CountsMat(data1(i),data2(i)) = ...
%         CountsMat(data1(i),data2(i)) + 1;
% end

MI_13 = MutualInfo(CountsMat13);
%-------------------------------------------------------------------
% % [MI] = MutualInfo(CountsMat)
% CountsMat=CountsMat13;
% nS = size(CountsMat);
% N = length(nS) - 1;
% Pxy = CountsMat/sum(CountsMat(:));
% Px = repmat(sum(Pxy,1),[nS(1),ones([1,N])]);%sum(A,1) is by colume,
% Py = repmat(sum(Pxy(:,:),2),[1,nS(2:end)]);
% temp = Pxy.*log2(Pxy./(Px.*Py));
% temp(~isfinite(temp)) = 0;
% MI = sum(temp(:));


CountsMat12 = CountsMat_generation(data_quant(:,1),data_quant(:,2));
MI_12 = MutualInfo(CountsMat12);

%% MI estimation using matrix-based Renyi definition
addpath(genpath('Renyi entropy'))
sigma = 1;
alpha = 1.01;
MI_13_Renyi = mutual_information_estimation(data(:,1),data(:,3),sigma,alpha);
MI_12_Renyi = mutual_information_estimation(data(:,1),data(:,2),sigma,alpha);





