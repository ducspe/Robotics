t0 = 0;
t1 = 0.3;
t2 = 0.4;
t3 = 0.8;
t4 = 1;

t = linspace(t0, t4, 1000);

interval1 = (t < t1);
interval2 = (t >= t1) & (t < t2);
interval3 = (t >= t2) & (t < t3);
interval4 = (t >= t3) & (t < t4);

b1= interval1 .* ((t-t0)./(t3-t0)).*((t-t0)./(t2-t0)).*((t-t0)./(t1-t0)); % t is in [t0,t1)

b2= interval2 .* (((t-t0)./(t3-t0)).*((t-t0)./(t2-t0)).*((t2-t)./(t2-t1)) + ((t-t0)./(t3-t0)).*((t3-t)./(t3-t1)).*((t-t1)./(t2-t1)) +((t4-t)./(t4-t1)).*((t-t1)./(t3-t1)).*((t-t1)./(t2-t1))) ; % t is in [t1, t2)


b3= interval3 .* (((t-t0)./(t3-t0)).*((t3-t)./(t3-t1)).*((t3-t)./(t3-t2)) + ((t4-t)./(t4-t1)).*((t-t1)./(t3-t1)).*((t3-t)./(t3-t2)) +((t4-t)./(t4-t1)).* ((t4-t)./(t4-t2)).*((t-t2)./(t3-t2))); % t is in [t2, t3)


b4= interval4 .* ((t4-t)./(t4-t1)).*((t4-t)./(t4-t2)).*((t4-t)./(t4-t3)); % t is in [t3,t4)

plot(t, b1)
xlabel('Time')
hold on 
plot(t, b2)
hold on 
plot(t, b3)
hold on 
plot(t, b4)


