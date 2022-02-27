
clear;
clc;

x0 = [0, 1, 0, 10];
tspan = [0, 0.3];
[T, X] = ode45(@f, tspan, x0);
s = 1:500;
v = zeros(1, size(s, 2));


for i = 1:size(s, 2)
    x0 = [[0, 1, 0] s(i)];
    [T, X] = ode45(@f, tspan, x0);
    for j = 1:size(X)
        if(max(abs(X(j)-X(1))) > 0.1 && T(j)~= 0)
            t = T(j);
            p = X(j, 1);
            v(i) = p/t;
            break;
        end
    end
end

plot(s, v)
ylabel('V');
xlabel('[s]');

function fx = f(t, x) %# ok
   
    fx = zeros(4, 1);

    fx(1) = 150 * x(3);
    fx(2) = 600 * x(3) + 150* x(3) -100 * x(2)*x(4);
    fx(3) = 100 * x(2)*x(4) - 600 * x(3) -150 * x(3);
    fx(4) = 600 * x(3) -100 * x(4)*x(2);
    
end
% In this problem, I used the hypothetical method of taking the average 
% rate of change of reactant P as the rate of change of reactant p over a 
% period of time when the concentration of various substances changes every 0.1uM.