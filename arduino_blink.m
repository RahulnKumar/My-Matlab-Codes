clear;
clear all;
clc; 
a = arduino();     

% start the loop to blink led for 5 seconds

for i=1:100

    writeDigitalPin(a, 'D13', 1);

    pause(0.5);

    writeDigitalPin(a, 'D13', 0);

    pause(0.5);

end