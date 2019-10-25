clear;
clear all;
clc;
%% code for controlling the brigtness of led using potetiometer
a = arduino();
time = 2000;
   while time > 0
      voltage = readVoltage(a, 'A0');
      writePWMVoltage(a, 'D9', voltage);

      time = time - 1;
      pause(0.1);
   end