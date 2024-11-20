function visualize_EEG(csv_file)
    EEG_signals = readmatrix(csv_file);
    
    Fs = 250; 
    
    num_samples = size(EEG_signals, 1); 
    t = (0:num_samples-1) / Fs; 

    num_channels = size(EEG_signals, 2);  
    
    figure;
    for ch = 1:num_channels
        subplot(num_channels, 1, ch);
        plot(t, EEG_signals(:, ch));
        title(['EEG Signal from Channel ', num2str(ch)]);
        xlabel('Time (s)');
        ylabel('Amplitude (\muV)');
    end
end

visualize_EEG('s01_ex01_s01.csv');