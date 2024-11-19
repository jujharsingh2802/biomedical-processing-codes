// AIM: To COMPUTE FFT OF RECORDED ECG SIGNAL FOR EXTRACTION OF FREQUENCY COMPONENTS IN THE SIGNAL
% Load ECG data and do its fourier transform
ecg = load('s0010_rem.mat');
signal = ecg.val(1, :);  % Assuming 'val' is a matrix, and we use the first row
fs = 1000;  % Sampling frequency
t = (0:length(signal)-1)/fs;  % Time vector

% Plot original EEG signal
figure;
subplot(4,1,1);
plot(t, signal);
title('Original ECG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Fourier Transform of EEG signal
ECG_fft = fft(signal);
n = length(signal);
frequencies = (0:n-1)*(fs/n);  % Frequency axis

% Plot magnitude spectrum of the EEG signal
subplot(4,1,2);
plot(frequencies, abs(ECG_fft));
title('Frequency Magnitude Spectrum of ECG Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Low-pass filter (keep low frequencies, attenuate high frequencies)
fc_low = 30;  % Low-pass filter cutoff frequency (in Hz, typically under 50 Hz for EEG)
[b_low, a_low] = butter(4, fc_low/(fs/2), 'low');  % 4th-order Butterworth filter
ecg_low_filtered = filter(b_low, a_low, signal);

% High-pass filter (remove low frequencies, keep high frequencies)
fc_high = 1;  % High-pass filter cutoff frequency (in Hz, e.g., to remove drift)
[b_high, a_high] = butter(4, fc_high/(fs/2), 'high');  % 4th-order Butterworth filter
ecg_high_filtered = filter(b_high, a_high, signal);

% Plot the filtered EEG signals
subplot(4,1,3);
plot(t, ecg_low_filtered);
title('Filtered ECG Signal: Low-pass');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(4,1,4);
plot(t, ecg_high_filtered);
title('Filtered ECG Signal:High-pass');
xlabel('Time (s)');
ylabel('Amplitude');