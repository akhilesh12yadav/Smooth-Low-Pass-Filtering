%% LOw pass filtering design with the differential equation (Expression)
% filtering the gyroscope sensor data

clc;
clear all;
close all;
%--------------------------------------------------%
%% Start from the loading data from txt file

% loading the sense data
% sensored data is in three dimension X,Y,Z
Gyro = load ('gyroscope_data_file.txt');

% plot the gyro sensor data
plot(Gyro);
title('Gyro sensor output data');
grid on;
% Taking individual gyroscope sensed data in individual axis
Gyro_x = Gyro(:,1);
Gyro_y = Gyro(:,2);
Gyro_z = Gyro(:,3);
%---------------------------------------------------------%
%% Initialization of the parameters
% Creating array for three axis to stored filtered data
          Gyro_xft = zeros(1500,1);
            Gyro_yft = zeros(1500,1);
                  Gyro_zft = zeros(1500,1);

% Initialization of variable that stores the return value of smooth low
% pass filter

 % Taking fixed alpha value for filtered output calculation
   Gyroscope_alpha = 0.80;
                       xft_out = 0;
                        yft_out = 0;
                           zft_out = 0;
 % initalization of previous value of Gyro axis
                           Gyro_prev_x =0;
                            Gyro_prev_y = 0;
                                 Gyro_prev_z = 0;
 %-----------------------------------------------------------%
%% Apply the loop for calling the smooth low pass filter

for i=1:1500
    
    xft_out = smooth_lp_for_gyro_data(Gyroscope_alpha,Gyro_prev_x,Gyro_x(i));
    %Storing the filter data of x-axis datainto new for future use
                       Gyro_xft(i) = xft_out;
    
     yft_out = smooth_lp_for_gyro_data(Gyroscope_alpha,Gyro_prev_y,Gyro_y(i));
     %Storing the filter data of y-axis datainto new for future use
                      Gyro_yft(i) = yft_out;
    
      zft_out = smooth_lp_for_gyro_data(Gyroscope_alpha,Gyro_prev_z,Gyro_z(i));
      %Storing the filter data of y-axis datainto new for future use
                      Gyro_zft(i) = zft_out;
      
      
      % Storing the previous value of the Low pass filter output
                                Gyro_prev_x = xft_out;
                                 Gyro_prev_y = yft_out;
                                   Gyro_prev_z = zft_out;
      
end
%--------------------------------------------------------------------%
%% Now ploting the filtered data
figure;
     plot(Gyro_xft);
     hold on;
        plot(Gyro_yft);
        hold on;
            plot(Gyro_zft);
            hold off;
            grid on;
            title('filtered out from the smooth low pas filter');
            
%Now design a lowpass filter with cutoff at 2000 Hz.
hd = lowpass2000_16k;
% Filter the original audio signal with this lowpass filter
yFilt = filter(hd, Gyro);

figure;
plot(yFilt);
grid on;
title(' Output of low pass filter with cutoff frequency 200Hz');


