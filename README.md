# Octocopter Model


The projects consists of the initialize parametr .m file and the star shape octocopter model .slx file. The properties of the octocopter are as follows.
1. NED frame is used in model.
2. Rotors are facing upward direction. 
3. The body frame coordinates are shown in below figure.

<p align="center">
  <img width="600" height="250" src="/Images/Frames.png">
</p>

4. The first rotor in the direction of  X<sub>B</sub> and it is clockwise direction (CW). The rest repeats the pattern counter clockwise (CCW) and CW respectively.
5. Octocopter model consists of;
   - Reference signal generator
   - PID cascade controller for rate and attitude control of Euler angles
   - Control allocation matrix calculation
   - Motor force and torque calculation
   - Nonlinear octocopter flight dynamics [[1]](#1)
   
<p align="center">
  <img width="600" height="350" src="/Images/Model.png">
</p>

# How to use
To run the model you simply follow the below steps.

1. Run initVariable.m file to initialize the parameters. (You can change the parameters to simulate different octocopter models)
2. The model is directly opened. Run the simulink model by pressing play button.

# Notes on Model and Abilites 
With the octocopter model, you can adjust;
* Initial condition of states
* PID controller gain parameter
* Reference signal parameters
* Error signal generator in case of analyzing rotor failure. [[2]](#2)
* Drone animation is also added to visualize to behavior of octocopter.[[3]](#3)

# References
<a id="1">[1]</a> 
Oscarson,O. (2015). Design, modeling and control of an octocopter. Kth royal institute of technology sci school of engineering sciences.STOCKHOLM, SWEDEN 2015

<a id="2">[2]</a> 
Walter, Ariel & Mckay, Michael & Niemiec, Robert & Gandhi, Feny. (2018). Trim Analysis of a Classical Octocopter After Single-Rotor Failure. 10.2514/6.2018-5035.

<a id="3">[3]</a> 
https://www.mathworks.com/matlabcentral/fileexchange/97192-quadcopter-model-matlab-code-for-animation?s_tid=srchtitle
