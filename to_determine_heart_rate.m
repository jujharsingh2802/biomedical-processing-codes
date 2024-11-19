// AIM: to Determine Heart Rate from recorded ECG signal
% Load ECG data and select the first channel
ecg = load('s0010_rem.mat');
signal = ecg.val(1, :);  % Assuming 'val' is a matrix, and we use the first row
fs = 1000;  % Sampling frequency

% High-pass filter to remove baseline wandering
hp_filter = designfilt('highpassiir', 'FilterOrder', 4, 'HalfPowerFrequency', 0.5, 'SampleRate', fs);
ecg_baseline_removed = filtfilt(hp_filter, signal);

% Low-pass filter to remove high-frequency noise
lp_filter = designfilt('lowpassiir', 'FilterOrder', 4, 'HalfPowerFrequency', 40, 'SampleRate', fs);
ecg_filtered = filtfilt(lp_filter, ecg_baseline_removed);

% Time vector
t = (0:length(signal) - 1) / fs;

% Define a threshold for R-peak detection
threshold = max(ecg_filtered) * 0.6;  % Adjust if needed

% Find R-peaks in the ECG signal
[peaks_R, locs_R] = findpeaks(ecg_filtered, 'MinPeakHeight', threshold, 'MinPeakDistance', fs/2);

% Calculate R-R intervals in seconds
RR_intervals = diff(locs_R) / fs;

% Calculate heart rate in beats per minute (bpm)
heart_rate = 60 ./ RR_intervals;

% Average heart rate
avg_heart_rate = mean(heart_rate);

% Plot the ECG signal with R-peaks
subplot(3,1,1)
plot(t,signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');


subplot(3,1,2)
plot(t,ecg_filtered);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3)
% Plot the ECG signal with R-peaks
plot(t, ecg_filtered, 'b'); % Plot original ECG signal in blue
hold on;
plot(locs_R / fs, peaks_R, 'ro'); % Plot R-peaks in red circles
title('Original Signal with R-Peaks');
xlabel('Time (s)');
ylabel('Amplitude');
legend('ECG Signal', 'R-Peaks');
hold off;

% Display the average heart rate
disp(['Average Heart Rate: ', num2str(avg_heart_rate), ' bpm']);