function ode1()

% SOLVE  dx/dt = -3 exp(-t).  
% initial conditions: x(0) = 0

t=0:0.001:5;   % time scalex
initial_x=0;

[t,x]=ode45( @rhs, t, initial_x);

plot(t,x);
xlabel('t'); ylabel('x');

    function dxdt=rhs(t,x)
        dxdt = 3*exp(-t);
    end
end