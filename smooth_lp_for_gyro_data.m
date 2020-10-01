% creating function for smoothing filter on Gyroscope sensor data
% LOw pass Smooth filter

function filtered_out = smooth_lp_for_gyro_data(Gyroscope_alpha,previs_val, currnt_val)

        % Taking fixed alpha value for filtered output calculation
        %Gyroscope_alpha = 0.80;
        
        % Differential equation of calculating filtered out
        filtered_output = ((Gyroscope_alpha*previs_val)+((1-Gyroscope_alpha)*currnt_val));
        
        % Returing the filtered value
        filtered_out = filtered_output;
        
        
        
   
end

