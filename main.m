%% CWM1-MATLAB - Constructed Wetland Model 1
% MATLAB implementation of CWM1 model.
%
% This code is designed to be coupled with a chemical species transport
% simulator (e.g., water flow in unsaturated porous media through Richards'
% Equation and an advection-dispersion model for solute transport)
%
% This file (main.m) shows an example of CWM1-MATLAB usage and performs a 
% speed comparison between plain MATLAB code and compiled .mex files.
% Moreover a benchmark is carried out to validate this model against the 
% simulation results obtained with PHREEQC software. 
%
% References:
%   CWM1 model: Langergraber et al. (2009)
%   PHREEQC implementation: Boog (2018)
%
% (c) Matteo M. 2022
clear;

%% SIMULATION PARAMETERS
N = 100;           % Number of instances (number of nodes of transport model)
t_sim = 5;         % Simulation duration (days)
dt = 0.02;         % Coupling time step (days)


%% MODEL COMPONENTS
% Initial conditions (g/L)
% S = SOLUBLE
So = 9.0e-3;            % comp#1. Dissolved oxygen
Sf = 0.5e-3;            % comp#2. Fermentable, readily biodegradable COD
Sa = 1.03e-3;			% comp#3. Fermentation products as acetate
Sin	= 0.5e-3;			% comp#4. Inert soluble COD.
Snh	= 0.5e-3;			% comp#5. Ammonium NH4+ and ammonia NH3 nitrogen
Sno	= 40.0e-3;			% comp#6. Nitrate NO3- and nitrite NO2- nitrogen
Sso4 = 10.00e-3;        % comp#7. Sulphate sulphur.
Sh2s = 10.00e-3;		% comp#8. Dihydrogensulphide sulphur.
% X = PARTICULATE
Xs = 0.5e-3;			% comp#9. Slowly biodegradable particulate COD.
Xi = 0.1e-3;			% comp#10. Inert particulate COD.
Xh = 1.36e-4;           % comp#11. Heterotrophic bacteria.
Xa = 1.36e-4;           % comp#12. Autotrophic nitrifying bacteria.
Xfb = 1.36e-4;          % comp#13. Fermenting bacteria.
Xamb = 1.36e-4;         % comp#14. Acetotrophic methanogenic bacteria.
Xasrb = 1.36e-4;		% comp#15. Acetotrophic sulphate reducing bacteria.
Xsob = 1.36e-4;         % comp#16. Sulphide oxidising bacteria.

% Initial condition vector (mg/L)
C0 = [So Sf Sa Sin Snh Sno Sso4 Sh2s Xs Xi Xh Xa Xfb Xamb Xasrb Xsob]*1000; 

% Water temperature (°C)
T = 20;

%% MODEL PARAMETERS
parameters;             % Load temperature-corrected model parameters from separate file

M = length(C0);         % Number of component
t = 0:dt:t_sim;         % Time vector
nt = length(t);         % Number of time steps


%% SOLVE - 1 - REGULAR MATLAB FUNCTION
disp('_______Simulations started_______')
disp(['Number of model instances: ' num2str(N)])
init_cond = repmat(C0,N,1); 
C = zeros(N,M,nt);      % Initialize state matrix
C(:,:,1) = init_cond;   % Initial condition

tic;
for k = 2:nt
    C(:,:,k) = cwm1(dt,params,C(:,:,k-1));
end
speed_reg = toc;
disp(['Regular function, total elapsed time: ' num2str(speed_reg) ' s'])


%% SOLVE - 2 - MEX FUCNTION SPEED TEST (>5x faster)
tic;
for k = 2:nt
	C(:,:,k) = cwm1_mex(dt,params,C(:,:,k-1));
end
speed_mex = toc;
disp(['MEX function, total elapsed time: ' num2str(speed_mex) ' s'])


%% BENCKMARK COMPARISON VS PHREEQC RESULTS

% LOAD PHREEQC OUTPUT
filename = 'phreeqc/phout_sel.dat';
opts = detectImportOptions(filename); % Preserves compatibility among different MATLAB versions
phr_data = readtable(filename,opts);
t_phr = phr_data.time/3600/24; t_phr(1) = 0;
phr = table2array(phr_data(:,9:24));

% PLOTS
figure;
plot(t,squeeze(C(1,:,:)),'Linewidth',1)
lgnd = {'So','Sf','Sa','Sin','Snh','Sno','Sso4','Sh2s','Xs','Xi','Xh','Xa','Xfb','Xamb','Xasrb','Xsob'};
hold all
plot(t_phr,phr*1000, '.')
legend(lgnd)
xlabel('Elapsed time (days)')
ylabel('Concentration (mg/L)')










