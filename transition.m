function [zero, G,P, r, rp, w, c, y, v] = transition(kold,h, params)
%transition takes a value of vector h and returns a competitive equilibrium
%  Production function: y = G^(a)*(P)^(b)*N^(1-a-b)
% Tax included in production function? 

G = zeros(S+1,1); 
P = zeros(S+1,1); 
G(1) = kold; % The capital in period T, as the transition begins.
P(1) = kold; % The capital in period T, as the transition begins.
r = zeros(S+1,1);
rp = zeros(S+1,1);
w = zeros(S+1,1);
c = zeros(S+1,1);
y = zeros(S+1,1);
v = zeros(S+1,1);

for t = 1:(S+1) % From T to T + 100
    N0(t) = N(t)/3;    %simplifying assumption TODO: find breakdown
    Nc(t) = N(t)/3;    %simplifying assumption
    % TODO: idea for solving Nc/Ni using dProfit with respect to Nc/Ni
    Ng(t) = N(t)/3;    %simplifying assumption
    r(t) = alpha *K(t)^(alpha-1) * N0(t)^(1-alpha-nu) * E(t)^(nu);   %Retun on capital K
    w(t) = (1-alpha-nu)*K(t)^(alpha) * N0(t)^(-alpha-nu) * E(t)^(nu); %Wage
    pc(t) = w(t) / xic + tauc;  % price carbon energy
    pg(t) = w(t) / xig;         % price green energy
    % TODO: solve for Ec
    % TODO: solve for Eg using fsolve proficFOCenergy
    Ng(t) = Eg(t) / xig;
    Nc(t) = Ec(t) / xic;
    v(t) = tauw*N(t)*w(t) + tauc*xic*Nc(t); % Government's revenue
    % TODO: intratemporal to solve for c
    % 
    % c(t) = 
    s(t) = (1-tauw)*w(t)*N(t) + r(t)*K(t) + v(t) - c(t);
    Ec(t) = xic * Nc(t);
    Eg(t) = xig * Ng(t);
    E(t) = energyOutput(TODO:PARAMETERS,Ec(t),Eg(t));
    % ? 
    y(t) = K(t)^alpha * N0(t)^(1-alpha-nu) * E(t)^(nu);
   % LMK?
end


% The Euler equation must hold in each period:
zero = clead./ct - beta.*(rlead + 1 - delta); 
% Impose steady state condition in T + S <=> 1 + S. No growth in steady
% state means clead./ct = 1.
zero(S+1) = 1 - beta.*(r(S+1) + 1 - delta); 

end