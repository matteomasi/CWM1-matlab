function C = cwm1(dt, params, init_cond)
%% CWM1-MATLAB - HANDLING FUNCTION
% CWM1 Initialize and run the ODE solver.
%
% Model parameters are passed as a vector to maximize compatibility with  
% MATLAB Coder for mex building.
%
% Usage:
%
%   C = CWM1(dt,params,init_cond)
%
% Input:
%   - dt: final time
%   - params: vector of model parameters. See parameters.m file.
%   - init_cond: matrix [Nx16], where N is the number of instances
%     and 16 is the number of components of the CWM1 model
%
% Output:
%   - C: Concentration matrix [Nx16] at the last integration step t = dt
%
% (c) Matteo M. 2022

% Function handle system of equation
ode_eqn = @(t,C) cwm1_odesystem(t,C,params); 

C = zeros(size(init_cond)); % Initialize concentration matrix
tspan = [0 dt];             % Time span

for i = 1:size(init_cond,1)
    % Solve (ode23 solver is faster than ode45, with acceptable accuracy)
    [~,Ctmp] = ode23(ode_eqn, tspan, init_cond(i,:)); 
    
    % Only save the final concentration at t = dt
    C(i,:) = Ctmp(end,:); 
end
    
end