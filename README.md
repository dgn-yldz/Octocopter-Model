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
   - PID cascade controller for rate, attitude, and altitude control of Octocopter
   - Control allocation matrix calculation
   - Motor force and torque calculation
   - Nonlinear octocopter flight dynamics [[1]](#1)
   
<p align="center">
  <img width="600" height="350" src="/Images/Model.png">
</p>

# How to use
To run the model you simply follow the below steps.

1. Run exampleCase.m file to initialize the parameters. (You can change the parameters to simulate different octocopter models)
2. The model is directly opened and run.

# Notes on Model and Abilites 
With the octocopter model, you can adjust;
* Initial condition of states
* PID controller gain parameter
* Reference signal parameters
* Simulation parameters
* Error signal generator in case of analyzing rotor failure. [[2]](#2)
* Drone animation is also added to visualize to behavior of octocopter.[[3]](#3) Note that the frame direction in inertial frame is different from the direction in       animation frame.The red propeller shows positive x-direction in octocopter frame and the blue propeller shows the positive y-direction in octocopter frame. 

<p align="center">
  <img width="600" height="450" src="/Images/octoAnimationgif.gif">
</p>

# References
<a id="1">[1]</a> 
Oscarson,O. (2015). Design, modeling and control of an octocopter. Kth royal institute of technology sci school of engineering sciences.STOCKHOLM, SWEDEN 2015

<a id="2">[2]</a> 
Walter, Ariel & Mckay, Michael & Niemiec, Robert & Gandhi, Feny. (2018). Trim Analysis of a Classical Octocopter After Single-Rotor Failure. 10.2514/6.2018-5035.

<a id="3">[3]</a> 
jitendra singh (2022). Quadcopter model: Matlab Code for Animation (https://www.mathworks.com/matlabcentral/fileexchange/97192-quadcopter-model-matlab-code-for-animation), MATLAB Central File Exchange. Retrieved May 25, 2022.

# Final note
I hope that this will be beneficial for your usage. For any bug or question please feel free to ask. You can find me on <a href="https://www.linkedin.com/in/do%C4%9Fan-yildiz-14a33123/"> <img src="/Images/linkedin.png" alt="LinkedIn Badge" width="20" height="20"/> </a>
                                                                                                                                     
                                                                                                                                     
