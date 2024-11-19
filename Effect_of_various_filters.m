// Aim: to study effects of various filters artifacts of ecg signals

% Read ECG data
function analyzeECGFilters()
    % Read the ECG signal
    fid = fopen('rec_1.dat', 'r');
    data = fread(fid, 'int16');
    fclose(fid);
    
    % Extract first channel (ECG I)
    ecg_signal = data(1:2:end);
    %% 
    
    % Sampling frequency (from header file)
    fs = 500;
    t = (0:length(ecg_signal)-1)/fs;
    
    % Add AWGN noise with modified variance
    noise_var = 0.05;  % Adjusted noise level
    noisy_signal = awgn(ecg_signal, 10*log10(1/noise_var), 'measured');
    
    % Calculate the noise component
    noise_component = noisy_signal - ecg_signal;
    
    % Plot original, noise component, and noisy signals with modified colors and styles
    figure('Name', 'ECG Signal Analysis');
    
    % Original Signal
    subplot(3,1,1);
    plot(t, ecg_signal, 'Color', [0 0.5 1], 'LineWidth', 2);  % Changed color to blue shade
    title('Original ECG Signal', 'FontWeight', 'bold');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    legend('Original Signal');
    
    % Noise Component
    subplot(3,1,2);
    plot(t, noise_component, 'Color', [1 0 0], 'LineWidth', 1.5);  % Red for noise
    title('AWGN Noise Component', 'FontWeight', 'bold');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    legend('Noise');
    
    % Noisy Signal with Original Overlay
    subplot(3,1,3);
    hold on;
    plot(t, ecg_signal, 'Color', [0 0.5 1], 'LineWidth', 1.5); % Original in blue shade
    plot(t, noisy_signal, 'Color', [0.85 0.33 0.1], 'LineWidth', 1); % Noisy in orange shade
    title('Original vs Noisy Signal Comparison', 'FontWeight', 'bold');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    legend('Original Signal', 'Noisy Signal');
    hold off;
    
    % Low-pass filter analysis
    cutoff_freqs_lp = [40 50 100];  % Hz
    figure('Name', 'Low-pass Filter Results');
    
    % Plot noisy signal
    subplot(length(cutoff_freqs_lp)+1, 1, 1);
    hold on;
    plot(t, ecg_signal, 'Color', [0 0.5 1], 'LineWidth', 1.5, 'DisplayName', 'Original');
    plot(t, noisy_signal, 'Color', [0.85 0.33 0.1], 'LineWidth', 1, 'DisplayName', 'Noisy');
    title('Original vs Noisy Signal');
    legend;
    grid on;
    hold off;
    
    % Apply and plot different low-pass filters
    for i = 1:length(cutoff_freqs_lp)
        filtered_signal = lowpass_filter(noisy_signal, cutoff_freqs_lp(i), fs);
        subplot(length(cutoff_freqs_lp)+1, 1, i+1);
        hold on;
        plot(t, ecg_signal, 'b:', 'LineWidth', 1, 'DisplayName', 'Original');
        plot(t, filtered_signal, 'g', 'LineWidth', 1.5, 'DisplayName', 'Filtered');
        title(['Low-pass filtered: Fc = ' num2str(cutoff_freqs_lp(i)) ' Hz']);
        legend;
        grid on;
        hold off;
    end 
    
    % High-pass filter analysis
    cutoff_freqs_hp = [0.1 0.23 0.56];  % Hz
    figure('Name', 'High-pass Filter Results');
    
    % Plot noisy signal
    subplot(length(cutoff_freqs_hp)+1, 1, 1);
    hold on;
    plot(t, ecg_signal, 'Color', [0 0.5 1], 'LineWidth', 1.5, 'DisplayName', 'Original');
    plot(t, noisy_signal, 'Color', [0.85 0.33 0.1], 'LineWidth', 1, 'DisplayName', 'Noisy');
    title('Original vs Noisy Signal');
    legend;
    grid on;
    hold off;
    
    % Apply and plot different high-pass filters
    for i = 1:length(cutoff_freqs_hp)
        filtered_signal = highpass_filter(noisy_signal, cutoff_freqs_hp(i), fs);
        subplot(length(cutoff_freqs_hp)+1, 1, i+1);
        hold on;
        plot(t, ecg_signal, 'b:', 'LineWidth', 1, 'DisplayName', 'Original');
        plot(t, filtered_signal, 'g', 'LineWidth', 1.5, 'DisplayName', 'Filtered');
        title(['High-pass filtered: Fc = ' num2str(cutoff_freqs_hp(i)) ' Hz']);
        legend;
        grid on;
        hold off;
    end
    
    % Notch filter analysis
    notch_freqs = [50 60];  % Hz (power line interference)
    figure('Name', 'Notch Filter Results');
    
    % Plot noisy signal
    subplot(length(notch_freqs)+1, 1, 1);
    hold on;
    plot(t, ecg_signal, 'Color', [0 0.5 1], 'LineWidth', 1.5, 'DisplayName', 'Original');
    plot(t, noisy_signal, 'Color', [0.85 0.4 0.1], 'LineWidth', 1, 'DisplayName', 'Noisy');
    title('Original vs Noisy Signal');
    legend;
    grid on;
    hold off;
    
    % Apply and plot different notch filters
    for i = 1:length(notch_freqs)
        filtered_signal = notch_filter(noisy_signal, notch_freqs(i), fs);
        subplot(length(notch_freqs)+1, 1, i+1);
        hold on;
        plot(t, ecg_signal, 'b:', 'LineWidth', 1, 'DisplayName', 'Original');
        plot(t, filtered_signal, 'g', 'LineWidth', 1.5, 'DisplayName', 'Filtered');
        title(['Notch filtered: Fn = ' num2str(notch_freqs(i)) ' Hz']);
        legend;
        grid on;
        hold off;
    end
end

% Low-pass filter implementation
function filtered = lowpass_filter(signal, cutoff_freq, fs)
    [b, a] = butter(4, cutoff_freq/(fs/2), 'low');
    filtered = filtfilt(b, a, double(signal));
end

% High-pass filter implementation
function filtered = highpass_filter(signal, cutoff_freq, fs)
    [b, a] = butter(4, cutoff_freq/(fs/2), 'high');
    filtered = filtfilt(b, a, double(signal));
end

% Notch filter implementation
function filtered = notch_filter(signal, notch_freq, fs)
    w0 = notch_freq/(fs/2);
    bw = w0/35;
    [b, a] = iirnotch(w0, bw);
    filtered = filtfilt(b, a, double(signal));
end
