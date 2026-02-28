clc;
close all;
clear;

% ------------------------------------------------------------
% SNR Effect on Demodulation Performance (Binary ASK)
% ------------------------------------------------------------

% Parameters
fs = 1000;                 % Sampling frequency (Hz)
t  = 0:1/fs:1;             % Time vector (1 second)
f_c = 50;                  % Carrier frequency (Hz)

SNR_value_1 = 10;          % dB
SNR_value_2 = 5;           % dB
SNR_value_3 = 0;           % dB
SNR_value_4 = -5;          % dB
SNR_list = [SNR_value_1 SNR_value_2 SNR_value_3 SNR_value_4];

% Generate a binary message signal (0/1)
message_signal = randi([0 1], 1, length(t));

% ASK Modulation (OOK: On-Off Keying)
carrier = cos(2*pi*f_c*t);
modulated_signal = message_signal .* carrier;

% Pre-allocate
BER = zeros(size(SNR_list));

% Figure for modulated reference
figure;
plot(t, modulated_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Original ASK Modulated Signal (No Noise)');

% Loop over SNR values
for k = 1:length(SNR_list)
    snr_db = SNR_list(k);

    % 1) Add AWGN noise to modulated signal
    received_signal = awgn(modulated_signal, snr_db, 'measured');

    % 2) Coherent demodulation
    % Multiply by carrier and low-pass filter (moving average)
    mixed = received_signal .* carrier;

    % Simple LPF via moving average (length chosen to smooth ~carrier cycles)
    L = round(fs / f_c);              % ~samples per carrier period
    lpf = ones(1, L) / L;
    baseband = filter(lpf, 1, mixed); % detected envelope/baseband

    % 3) Decision (threshold)
    % Since message is 0/1, baseband level is ~0 for 0 and >0 for 1
    threshold = 0.25 * max(baseband);        % simple robust threshold
    demod_bits = baseband > threshold;       % recovered binary

    % 4) BER calculation
    BER(k) = sum(demod_bits ~= message_signal) / length(message_signal);

    % -------------------------
    % Plot for each SNR case
    % -------------------------
    figure;
    subplot(3,1,1);
    plot(t, modulated_signal);
    grid on;
    xlabel('Time (s)'); ylabel('Amp');
    title('Transmitted ASK Modulated Signal');

    subplot(3,1,2);
    plot(t, received_signal);
    grid on;
    xlabel('Time (s)'); ylabel('Amp');
    title(['Received Signal with AWGN, SNR = ' num2str(snr_db) ' dB']);

    subplot(3,1,3);
    plot(t, baseband); hold on;
    yline(threshold,'--');
    grid on;
    xlabel('Time (s)'); ylabel('Amp');
    title(['Demodulated Baseband (Detected), BER = ' num2str(BER(k))]);
    legend('Baseband','Threshold');
end

% Print summary
fprintf('\n--- SNR vs BER Results (ASK) ---\n');
for k = 1:length(SNR_list)
    fprintf('SNR = %4.1f dB  ->  BER = %.4f\n', SNR_list(k), BER(k));
end
fprintf('\n');