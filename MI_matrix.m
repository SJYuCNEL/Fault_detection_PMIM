function MImatrixcell = MI_matrix(data,sigma,alpha,MIsize)
% Input:
%      data is the sample matrix X 
%      MIsize is the length of sliding window
%      alpha is the entropy order
%      sigma is the kernel size
% Output:
%      MImatrixcell is a series of mutual information(MI) matrix over the whole process
[nums nums_vars]=size(data); 
[Data, av, st]=zscore(data);  
for k=1:nums-MIsize+1
    dydata=Data(k:k+MIsize-1,:);
%  MImatrix is the MI matrix at time instant k    
    for i=1:nums_vars
          for j=i:nums_vars
               MImatrix(i,j) = mutual_information_estimation(dydata(:,i),dydata(:,j),sigma,alpha);
               MImatrix(j,i) = MImatrix(i,j);
          end
    end
   MImatrixcell{1,k} = MImatrix;
end

end