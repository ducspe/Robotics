t0 = 0;
t1 = 4;

t = linspace(t0, t1, 1000);

interval1 = t<t1;

b1 = interval1 .* 1;

plot(t, b1);
xlabel('Time');
ylim([0 1.1])
