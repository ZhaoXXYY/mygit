

clear;
clc;

x0 = [0, 1, 0, 10];
tspan = [0, 0.3];
[T, X] = ode45(@f, tspan, x0);

figure;
subplot(4, 1, 1)
plot(T, X(:, 1))
ylabel('X_1');

subplot(4, 1, 2)
plot(T, X(:, 2))
ylabel('X_2');

subplot(4, 1, 3)
plot(T, X(:, 3))
ylabel('X_3');

subplot(4, 1, 4)
plot(T, X(:, 4))
ylabel('X_4');
xlabel('Time');

function fx = f(t, x) %# ok
   
    fx = zeros(4, 1);

    fx(1) = 150 * x(3);
    fx(2) = 600 * x(3) + 150* x(3) -100 * x(2)*x(4);
    fx(3) = 100 * x(2)*x(4) - 600 * x(3) -150 * x(3);
    fx(4) = 600 * x(3) -100 * x(4)*x(2);
    
end