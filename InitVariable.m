% Initialize Variables of Octocopter. 
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
% Copyright 2019 The MathWorks, Inc.
clearvars;
mass                        = 10.0; %kg
moment_of_inertia           = diag([1.0, 1.0, 2.0]); % kg_m_m
gravity                     = 9.81; %m/s
number_of_actuators         = 8;
rotor_thrust_coeff          = 0.05;    % rotor_thrust_N = rotor_thrust_coeff*rotor_rad_per_s^2
rotor_torque_coeff          = 0.005;   % rotor_torque_Nm = rotor_torque_coeff*rotor_rad_per_s^2
rotor_max_rad_per_s         = 30;      % maximum  allowed rotor spinning velocity (in both directions)
rotor_min_rad_per_s         = 0;       % minimum rotor spinning velocity (stop)
l1                          = 0.45;    % long arm length[m]
l2                          = 0.45;    % short arm length[m]
alpha                       = 0;       % Tilt angle of motors
dt                          = 0.01;    % Simulation Time
% Initial condition of integrators
vbInt_initial               =[0;0;0];
omegaInt_initial            =[0;0;0];
EulerInt_initial            =[0;0;0];
PosInertialInt_initial      =[0;0;0];
% PID control gain parameters initilization
Kp_z                        = 22;      
Ki_z                        = 60;
Kd_z                        = 2.2;

Kp_vz                       = 8;
Ki_vz                       = 4;
Kd_vz                       = 4.2;

Kp_phi                      = 0.9;
Ki_phi                      = 0.5;
Kd_phi                      = 1.9;

Kp_phidot                   = 0.9;
Ki_phidot                   = 0.3;
Kd_phidot                   = 0.2;

Kp_theta                    = 1.6;
Ki_theta                    = 0.4;
Kd_theta                    = 0.7;

Kp_thetadot                 = 1.5;
Ki_thetadot                 = 0.5;
Kd_thetadot                 = 0.1;

Kp_psi                      = 1.5;
Ki_psi                      = 0.4;
Kd_psi                      = 0.8;

Kp_psidot                   = 1.9;
Ki_psidot                   = 0.2;
Kd_psidot                   = 0.1;

% Reference signal parameters
zRefStepTime                =0;
zRefFinal                   =0;

phiRefStepTime              =0;
phiRefFinal                 =0;

thetaRefStepTime            =0;
thetaRefFinal               =0;

psiRefStepTime              =0;
psiRefFinal                 =0;

% Error signal parameters 
err1Enable                  =0;
motorErr1Time               =0;

err2Enable                  =0;
motorErr2Time               =0;

err3Enable                  =0;
motorErr3Time               =0;

err4Enable                  =0;
motorErr4Time               =0;

err5Enable                  =0;
motorErr5Time               =0;

err6Enable                  =0;
motorErr6Time               =0;

err7Enable                  =0;
motorErr7Time               =0;

err8Enable                  =0;
motorErr8Time               =0;

% First order filter initial parameter
K1                          = 0.5;