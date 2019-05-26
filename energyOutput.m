function [E] = energyOutput(params, Ec, Eg)
%UNTITLED2 Summary of this function goes here
% Parameters
kappac = params(1);
kappag = params(2);
rho = params(3);

% Total Energy output with CES
E = (kappac * Ec.^rho + kappag * Eg.^rho).^(1-rho);
end

