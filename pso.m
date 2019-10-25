% Particle Swarm Optimization
clear all
clc

% Minimizing problem
f = @(x1,x2,x3,x4,x5,x6)(x1-1)^2+(x2+55)^2+(x3-55)^2+(x4-4)^2+(x5-5)^2+(x6-6)^2;
    
popsize = 15;     % No. of particles
npar = 6;           % Dimension of th eproblem
c =  0.1;             % constriction factor
% c1 = 0.5;             % Inertial Weight
c2 = 1.7;             % Cognitinve Coefficint
c3 = 2.3;             % Social Coefficient
maxit = 1000;        % No. of iteratiom


% Initializing Population and velocity
par = -100 + 200*rand(popsize,npar);     % initial population
vel(popsize,npar) = 0;                % initial velocity

for i= 1:popsize
    cost(i,1) = f(par(i,1),par(i,2),par(i,3),par(i,4),par(i,5),par(i,6));
end

localpar = par;
localcost = cost;

[globalcost ind] = min(cost);
globalpar = par(ind(1),:);

for iter = 1:maxit
    
    c1 = (maxit - iter)/maxit;

    minc(iter) = min(cost);    

    % Calculation of velocities of particles
    vel = c*(c1*vel + c2*rand(popsize,npar).*(localpar-par)+c3*rand(popsize,npar).*(repmat(globalpar,popsize,1)-par));
    
    % Particle Update
    par = par + vel;

    % Cost calculation
    for i= 1:popsize
        cost(i,1) = f(par(i,1),par(i,2),par(i,3),par(i,4),par(i,5),par(i,6));
    end
        
    % Local minimum calculation
    flag = cost < localcost
    localcost = cost.*flag + localcost.*(1-flag);
    localpar = par.*repmat(flag,1,npar) + localpar.*repmat((1-flag),1,npar);
    
    [temp ind] = min(cost);
    if temp < globalcost
        globalcost = temp;
        globalpar = par(ind,:);
    end
end

globalpar
min(cost)
plot(minc)