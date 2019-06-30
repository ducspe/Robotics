t0 = 0;
t1=2;
t2=4;

t = linspace(t0, t2, 1000);

interval1 = t<t1;
interval2 = t>=t1 & t< t2;

b1 = interval1 .* (t-t0)./(t1-t0);

b2 = interval2 .* (t2-t)./(t2-t1);

plot(t, b1)
xlabel('Time')
hold on
plot(t, b2)