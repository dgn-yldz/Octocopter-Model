%% Example Case for Octocopter Simulation
% Copyright (C) 2022 Dogan Yildiz <doganyildiz1990@gmail.com>
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
% Dogan Yildiz <doganyildiz1990@gmail.com> Department of Electrical - Electronics Engineering
% Middle East Technical University, METU Teknokent
% Copyright 2019 The MathWorks, Inc
%% Simple Attitude Commands and Plots
clc;close all;
InitVariable;
open_system("octocopterDynamicModel");
runTime = 6;
t = (0:dt:runTime)';

% Reference altitude
zRefFinal = -10;
PosInertialInt_initial      =[0;0;-10];

% Roll Step Input Simulation 
% At time 1 seconds: roll step input
phiRefStepTime              =1;
phiRefFinal                 =(-5)*pi/180; % 5 deg

% Pitch Step Input Simulation
% At time 1 seconds: pitch step input

thetaRefStepTime            =1;
thetaRefFinal               =(-10)*pi/180; % 10 deg

% Yaw Step Input Simulation
% At time 1 seconds: yaw step input

psiRefStepTime              =1;
psiRefFinal                 =(60)*pi/180; % 60 deg

% Run the simulink model
disp('Start Simulation...')
out = sim("octocopterDynamicModel",runTime);
disp('End of Simulation.')
%% Plots
% Desired attitude commands (roll, pitch, yaw) vs actual ones (fourth,
% fifth and sixth elements of x)
% x and dx in separated figures
% commands u, and square-root of commands u,

% 1) Desired attitude commands (roll, pitch, yaw) vs actual ones 
%    (fourth,fifth and sixth elements of x)
h1 = plotEasyFcn(t,out.phi,out.phiRef,'Roll Response','$\phi$ [rad]',{'$\phi$';'Ref'});
h2 = plotEasyFcn(t,out.theta,out.thetaRef,'Pitch Response','$\theta$ [rad]',{'$\theta$';'Ref'});
h3 = plotEasyFcn(t,out.psi,out.psiRef,'Yaw Response','$\psi$ [rad]',{'$\psi$';'Ref'});
% 2) x and dx in separated figures
h4 = plotEasyFcn(t,out.xPos,[],'Inertial Pos-x Response','x [m]',{'x'});
h5 = plotEasyFcn(t,out.yPos,[],'Inertial Pos-y Response','y [m]',{'y'});
h6 = plotEasyFcn(t,out.zPos,[],'Inertial Pos-z Response','z [m]',{'z'});

h7 = plotEasyFcn(t,out.vx,[],'Inertial Vx Response','Vx [m/s]',{'vx'});
h8 = plotEasyFcn(t,out.vy,[],'Inertial Vy Response','Vy [m/s]',{'vy'});
h9 = plotEasyFcn(t,out.vz,[],'Inertial Vz Response','Vz [m/s]',{'vz'});

h10 = plotEasyFcn(t,out.phidot,[],'$\dot{\phi}$ Response','$\dot{\phi}$ [rad/s]',{'$\dot{\phi}$'});
h11 = plotEasyFcn(t,out.thetadot,[],'$\dot{\theta}$ Response','$\dot{\theta}$ [rad/s]',{'$\dot{\theta}$'});
h12 = plotEasyFcn(t,out.psidot,[],'$\dot{\psi}$  Response','$\dot{\psi}$ [rad/s]',{'$\dot{\psi}$'});

% 3) Commands u, and square-root of commands u,
ax = zeros(8,1);
for i = 1:8
    
ax(i) = subplot(2,4,i);
plot(t,out.omegaRotors(:,i),'Linewidth',2)
hold on
plot([t(1) t(end)],[rotor_max_rad_per_s^2 rotor_max_rad_per_s^2],'r--','Linewidth',2);
hold on 
plot([t(1) t(end)],[rotor_min_rad_per_s^2 rotor_min_rad_per_s^2],'r--','Linewidth',2);
grid on
axis tight
title(['(\omega_' num2str(i) ')^2' ' ' 'CW(1)/CCW(-1)=' num2str((-1)^(i+1)) ])
    
end

linkaxes(ax,'xy')

ax1 = zeros(8,1);
for i = 1:8
    
ax1(i) = subplot(2,4,i);
plot(t,sqrt(out.omegaRotors(:,i)),'Linewidth',2)
hold on
plot([t(1) t(end)],[rotor_max_rad_per_s rotor_max_rad_per_s],'r--','Linewidth',2);
hold on 
plot([t(1) t(end)],[rotor_min_rad_per_s rotor_min_rad_per_s],'r--','Linewidth',2);
grid on
axis tight
title(['(\omega_' num2str(i) ')' ' ' 'CW(1)/CCW(-1)=' num2str((-1)^(i+1))])
    
end

linkaxes(ax1,'xy')

%% Drone Simulation 
% The reference of the code was given in references section. If animation
% video is desired, set animationON = 1.
animationON = 0;
drone_Animation(out.xPos,-out.yPos,-out.zPos,out.phi*180/pi,-out.theta*180/pi,out.psi*180/pi,animationON) 