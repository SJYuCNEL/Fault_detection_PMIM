function Di = MITCSA(data,MImatrixcell,MIsize)
% Input:
%      data is the sample matrix X
%      MIdata is the MI matrix of data
%      MIsize is the length w of sliding window
% Output:
%      Di is the similarity index 
for i=1:length(MImatrixcell)
    MImatrix=MImatrixcell{1,i}; 
%  Eigen-decomposition of the mutual information(MI) matrix
    [Vet C]=eig(MImatrix,'vector');
% The MI based transform components(TCs)
    T=data{1,i}*Vet;
% The statistic of TCs
    Mu(i,:) = mean(T);% mean
    V(i,:) = sum((T-Mu(i,:)).^2)/MIsize; % variance
    S1(i,:)= sum((T-Mu(i,:)).^3)/MIsize;
    K1(i,:)= sum((T-Mu(i,:)).^4)/MIsize;
    S(i,:) = S1(i,:)./(V(i,:).^(3/2)); % skewness
    K(i,:) = K1(i,:)./(V(i,:).^2)-3;   % kurtosis
end
Oo = [Mu,V,S,K];    
Mu_mu = mean(Mu);% the reference mean
Oo_mu = mean(Oo);  
Oo_sv = std(Oo,1); 
% The calculation of the similarity index 
for i=1:length(MImatrixcell)
      D1 = Oo(i,:)-Oo_mu;
      D = D1./(Oo_sv);
      Di(1,i) = norm(D,inf); 
end

end