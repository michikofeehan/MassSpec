%MichikoFeehan  
%May 3, 2017  
%Numerical Integration of ODE

%Part (f): Solve for A(t) for (0 <= t <= 30) using MATLAB function ode45().
%Plot A(t) as a function of time.

tspan = [0,30]; %time initial to time final  
y0 = 1; %initial condition
[t,y] = ode45(@(t,y) ((0.8*y)*(1-(y/60)^(0.25))), tspan,y0);

plot(t,y,'-o')
title('Solution of tumor growth equation with ODE45 ');
xlabel('time (days)');
ylabel('Area of tumor A(t)');
