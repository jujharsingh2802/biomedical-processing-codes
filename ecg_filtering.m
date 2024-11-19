//  AIM: ECG FILTERING
ecg = load('s0010_rem.mat');
signal = ecg.val; % Selecting the first channel
fs = 1000; % Sampling frequency

% High-pass filter to remove baseline wandering
hp_filter = designfilt('highpassiir','FilterOrder',2,'HalfPowerFrequency',0.5,'SampleRate',fs);
ecg_baseline_removed = filtfilt(hp_filter, signal);

% Low-pass filter to remove high-frequency noise
lp_filter = designfilt('lowpassiir','FilterOrder',2,'HalfPowerFrequency',40,'SampleRate',fs);
ecg_filtered = filtfilt(lp_filter, ecg_baseline_removed);

% Time vector
t = (0:length(signal)-1)/fs;

% Plot the original and filtered signals
subplot(2,1,1)
plot(t,signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2)
plot(t, ecg_filtered);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');