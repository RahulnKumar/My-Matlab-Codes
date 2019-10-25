% Particle Swarm Optimization
clear all
clc

% Minimizing problem
f = @(x1,x2,x3,x4,x5,x6)(x1-1)^2+(x2+55)^2+(x3-55)^2+(x4-4)^2+(x5-5)^2+(x6-6)^2;
    
popsize = 30;     % No. of particles
npar = 6;           % Dimension of th eproblem
c =  0.05;             % constriction factor
c2 = 2;             % Cognitinve Coefficint
c3 = 2;             % Social Coefficient
maxit = 1000;        % No. of iteratiom


% Initializing Population and velocity
par = -100 + 200*rand(popsize,npar);     % initial population
v(popsize,npar) = 0;                % initial velocity


for j=1:maxit

    c1 = (maxit - j)/maxit;
    
    
% Cost calculation
    for i= 1:popsize
        cost(i,1) = f(par(i,1),par(i,2),par(i,3),par(i,4),par(i,5),par(i,6));
    end
    minc(j) = min(cost);

    % Local minimum calculation
    

    
         if j>1
         for i=1:popsize
            if cost(i)<f(par(i,1),par(i,2),par(i,3),par(i,4),par(i,5),par(i,6))
                localpar(i,:) = par(i,:);
            else
                localpar(i,:) = parp(i,:);
            end
          end
     else
         localpar=par;
     end
%     Global minimum calculation
    for i=1:popsize
        if i==1
            for i=1:popsize
                icost(i)=f(localpar(i,1),localpar(i,2),localpar(i,3),localpar(i,4),localpar(i,5),localpar(i,6));
            end
                [icost index]=sort(icost);
                globalpar=localpar(index,:);
                globalpar=globalpar(1,:);
                gcost=icost(1);
        else
            if f(localpar(i,1),localpar(i,2),localpar(i,3),localpar(i,4),localpar(i,5),localpar(i,6))<gcost
             globalpar =  localpar(i,:);
            else
                globalpar = globalpar;
            end
        end
    end

 % Calculation of velocities of particles

    v = c*(c1*v + c2*rand(popsize,npar).*(localpar-par)+c3*rand(popsize,npar).*(repmat(globalpar,popsize,1)-par));


% calculation of new particles

    fpar = par + v;
    parp=par ;        %particles in previous iteration
    par=fpar;         %particles for next iteration    
end
globalpar
min(cost)
plot(minc)