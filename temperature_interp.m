function KT = temperature_interp(K20,K10,T)
%% CWM1-MATLAB - PARAMETERS TEMPERATURE INTERPOLATION
% Expression from Henze et al. (2006)

T1 = 20;
T2 = 10;
theta = log(K20/K10)/(T1-T2);
KT = K20*exp( theta*(T-20) );

end

