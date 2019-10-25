% continuous genetic algorithm]
clear all
clc
f = @(a,b,c,d,e,f,g,h)(a-2)^2+(b-1)^2+(c-3)^2+(d-4)^2+(e-5)^2+(f-6)^2+(g-7)^2+(h-8)^2;

popsize = 1000;
maxit = 25;

% initial population
par = -100 + 200*rand(popsize,8);

for itr = 1:maxit
    
    % cost calculation
    for i=1:length(par)
        cost(i,1)= f(par(i,1),par(i,2),par(i,3),par(i,4),par(i,5),par(i,6),par(i,7),par(i,8));
    end

    minc(itr) = min(cost);
    
    [cost index] = sort(cost);
    par = par(index,:);
    
    % creation roullete wheel
    p = 1./cost;
    per = (1/sum(p)).*p;
    rw = cumsum(per);
%creation of new pool according to roullete wheel
    for i=1:popsize
     r=rand;
     a=find(rw(:,1)>r);
     npar(i,:)=par(a(1),:);
    end
      
    % creation of new population

      j=1;
      for i=1:1:0.5*length(par)
          r=rand;
          fp(j,:)=r*npar(i,:)+(1-r)*npar(i+1,:);
          fp(j+1,:)=r*npar(i+1,:)+(1-r)*npar(i,:);
          j=j+2;
      end
      par=fp;
end
plot(minc)
par(1,:)
minc(end)