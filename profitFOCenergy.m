function [outputArg1,outputArg2] = profitFOCenergy(params,K,N0,Ec,Eg,p)
%Gives the FOCs for the energy firms
    %Note: Ei= Ec, Ej = Eg ... generalize it?
%parameters
params(1) = nu;
params(2) = alpha;
params(3) = rho;
params(4) = kappac;
params(5) = kappag;
newparams = [kappac, kappag, rho];
E = energyOutput(newparams, Ec,Eg);

% derivative of energy production wrt E
Ederivc = 1/rho * (kappac * Ec.^rho + kappag * Eg.^rho).^(1/rho - 1) .* rho*kappac.*Ec.^(rho-1);
Ederivg = 1/rho * (kappag * Eg.^rho + kappac * Ec.^rho).^(1/rho - 1) .* rho*kappag.*Eg.^(rho-1);

% Function for Energy firms FOCs
zeroc = nu*K.^alpha .* N0.^(1-alpha-nu) .* E.^(nu-1) .* Ederivc - p;
zerog = nu*K.^alpha .* N0.^(1-alpha-nu) .* E.^(nu-1) .* Ederivg - p;

end

