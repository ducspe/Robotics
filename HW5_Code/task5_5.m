t = (0:0.01:4.5); % will simulate from time = 0 seconds to time = 4.5 seconds in small increments of 0.01 seconds

% Calculate the saturated ramp function:
unitstep = t>=0;
shiftedstep = t>=1; % will be used to saturate the part beyond t = 1
shiftedandinvertedstep = t < 1; % will be used to strip the part beyond t = 1

ramp = t.*unitstep; % this will continue growing beyond t = 1

% First strip out the amplitude beyond t = 1 and then add 1's (ones) instead to simulate the saturation:
ramp= ramp.*shiftedandinvertedstep + shiftedstep; % this will become saturated after t = 1

% Describe the motor:
J = 0.1; % Moment of inertia of the rotor: Kg*m*m
b = 0.1; % Motor viscous friction constant: N*m*s
K = 0.01; % Motor torque constant: N*m/Amp
R = 1; % Electric resistance: Ohm
L = 0.5; % electric inductance: H (Henry)

% Describe its transfer function:
s = tf('s'); % s is the transfer function frequency variable as it is typically denoted in Laplace theory
sys = K/((J*s+b)*(L*s+R)+K*K); % describe the transfer function of the system in terms of 's'

% Case 1 from the task:
% The PID control variables are:
Kp1=20;
Ki1=0;
Kd1=0;
contr1 = Kp1 + Ki1/s + Kd1*s; % PID model in the frequency domain: integrator representation is 1/S and derivative operator is times s: ' * S' 
unitstep1 = feedback(contr1*sys,1); % feedback function with a gain of 1
step(unitstep1); % use the builtin functionality to get AND plot the step response

[rampresponse1,t]=lsim(unitstep1, ramp,t); % feed in the ramp function defined previously and get the response that we will plot later in a separate figure

% Case 2 from the task:
% The comments above apply to the section below as well
hold on;
Kp2=500;
Ki2=0;
Kd2=0;
contr2 = Kp2 + Ki2/s + Kd2*s;
unitstep2 = feedback(contr2*sys,1);
step(unitstep2);
[rampresponse2,t]=lsim(unitstep2, ramp,t);

% Case 3 from the task:
% The previous comments still apply as we only change the variable values
hold on;
Kp3=100;
Ki3=50;
Kd3=0;
contr3 = Kp3 + Ki3/s + Kd3*s;
unitstep3 = feedback(contr3*sys,1);
step(unitstep3);
[rampresponse3,t]=lsim(unitstep3, ramp,t);

legend('step1','step2','step3'); % legend for the first figure


% Plot the ramp response in a separate figure to avoid overclutter:
figure;
plot(t,[rampresponse1, rampresponse2, rampresponse3]);
legend('ramp1','ramp2','ramp3');
title('Ramp Response');
xlabel('Time (seconds)');
ylabel('Amplitude');


