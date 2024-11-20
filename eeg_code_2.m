// 5th exp
data=load('S001R02_edfm (1).mat');
fields=fieldnames(data);
disp(fields);
eeg_sig=data.val;
num_ch=size(eeg_sig,1);
rows=11;
col=2;
for channel = 1:num_ch
    subplot(rows, col, channel);
    plot(eeg_sig(channel, :), 'LineWidth', 1);
    title(['EEG Channel ', num2str(channel)], 'FontSize', 10);
    grid on;
    xlabel('Sample Points');
    ylabel('Amplitude');
end