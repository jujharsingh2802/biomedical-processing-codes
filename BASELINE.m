// AIM: TO REMOVE BASELINE WANDER AND HIGH FREQ NOISE FROM ECG SIGNAL USING APPROPRIATE DIGITAL FILTER FOR EXTRACTING PROCESSAVLE ECG SIGNAL

% Load the .mat file
data = load('s0010_rem.mat');

% Display the available variables to find the correct one
disp(fieldnames(data));

% Access the ECG signal (replace 'your_variable_name' with the correct variable name)
ecg_signal = data.val;

% Sampling frequency (Hz)
fs = 1000;  
% Adjust this according to your datas actual sampling frequency

% Define the cutoff frequency for the high-pass filter
cutoff_frequency = 0.5;  % Typically 0.5 Hz is used to remove baseline wander in ECG signals

% Design the high-pass Butterworth filter
[b, a] = butter(1, cutoff_frequency/(fs/2), 'high');

% Apply the filter to the ECG signal using filtfilt to avoid phase distortion
filtered_ecg_signal = filtfilt(b, a, ecg_signal);

% Plot the original and filtered signals for comparison
time = (0:length(ecg_signal)-1) / fs;

figure;
subplot(2,1,1);
plot(time, ecg_signal);
title('Original ECG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(time, filtered_ecg_signal);
title('Filtered ECG Signal (Baseline Wander Removed)');
xlabel('Time (s)');
ylabel('Amplitude');