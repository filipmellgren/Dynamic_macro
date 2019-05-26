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
    r(t) = a*G(t)^(a-1)*(P(t)*(1-taup))^b*N(t)^(1-a-b); 
    rp(t) = (1-taup)*b*G(t)^(a)*(P(t)*(1-taup))^(b-1)*N(t)^(1-a-b); % Return on capital p. Not 100% on derivative here. CHain rule.
    w(t) = (1-a-b)*G(t)^(a)*(P(t)*(1-taup))^b*N(t)^(-a-b);
    v(t) = taup*P(t) + tauw*w(t)*h(t); % Government's revenue
    % c(t)
    y(t) = G(t)^(a)*P(t)^b*N(t)^(1-a-b);
   % LMK?
end

% The Euler equation must hold in each period:
zero = clead./ct - beta.*(rlead + 1 - delta); 
% Impose steady state condition in T + S <=> 1 + S. No growth in steady
% state means clead./ct = 1.
zero(S+1) = 1 - beta.*(r(S+1) + 1 - delta); 

end