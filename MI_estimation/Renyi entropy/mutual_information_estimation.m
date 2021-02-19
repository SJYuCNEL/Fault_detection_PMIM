function mutual_information = mutual_information_estimation(variable1,variable2,sigma,alpha)

%  variable 1 is feature 1
%  variable 2 is feature 2

%% estimate entropy for variable 1
K_x = real(guassianMatrix(variable1,sigma))/size(variable1,1);
[~, L_x] = eig(K_x);
lambda_x = abs(diag(L_x));
H_x = (1/(1-alpha))*log((sum(lambda_x.^alpha)));    

%% estimate entropy for variable 2
K_y = real(guassianMatrix(variable2,sigma))/size(variable2,1);
[~, L_y] = eig(K_y);
lambda_y = abs(diag(L_y));
H_y = (1/(1-alpha))*log((sum(lambda_y.^alpha)));
    
%% estimate joint entropy H(X,Y)
K_xy = K_x.*K_y.*size(variable1,1);
[~,L_xy] = eig(K_xy);
lambda_xy = abs(diag(L_xy));
H_xy =  (1/(1-alpha))*log( (sum(lambda_xy.^alpha)));
    
%% estimate mutual information I(X;Y)
mutual_information = H_x + H_y - H_xy;

end