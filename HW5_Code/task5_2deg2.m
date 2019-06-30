t0 = 0;
t1 = 1.33;
t2 = 2.66;
t3 = 4;

t = linspace(t0, t3, 1000);

interval1 = (t < t1);
interval2 = (t >= t1) & (t < t2);
interval3 = (t >= t2) & (t < t3);

b1 = interval1 .* (((t-t0)./(t2-t0)).*((t-t0)./(t1-t0)));

b2 = interval2 .* (((t-t0)./(t2-t0)).*((t2-t)./(t2-t1)) + (((t3-t)./(t3-t1)).*((t-t1)./(t2-t1))));

b3 = interval3 .* (((t3-t)./(t3-t1)).*((t3-t)./(t3-t2)));

plot(t, b1)
xlabel('Time')
hold on
plot(t, b2)
hold on
plot(t, b3)