clc;
close all;
clear;

% ---------------------------------------------------------
% Assignment: Add and Remove Noise from a Signal (MATLAB)
% ---------------------------------------------------------

% Parameters
fs = 1000;                 % Sampling frequency (Hz)
t = 0:1/fs:1;              % Time vector (1 second)
f_signal = 5;              % Signal frequency (Hz)
amplitude = 1;             % Signal amplitude

noise_std = 0.5;           % Noise level (standard deviation) - adjust to experiment

cutoff_frequency = 10;     % Low-pass cutoff frequency (Hz) - adjust to experiment
filter_order = 4;          % Butterworth filter order

% 1) Generate sinusoidal signal
original_signal = amplitude * sin(2*pi*f_signal*t);

% 2) Add Gaussian white noise
noise = noise_std * randn(size(t));
noisy_signal = original_signal + noise;

% 3) Low-pass Butterworth filter design
Wn = cutoff_frequency / (fs/2);     % Normalize cutoff to Nyquist frequency
[b, a] = butter(filter_order, Wn, 'low');

% 4) Filter the noisy signal (zero-phase filtering for better waveform shape)
filtered_signal = filtfilt(b, a, noisy_signal);

% -------------------------
% Plots (Time Domain)
% -------------------------
figure;
plot(t, original_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Sinusoidal Signal');

figure;
plot(t, noisy_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Signal (Original + Gaussian Noise)');

figure;
plot(t, filtered_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal (Low-pass Butterworth)');

% Combined comparison plot (recommended for submission)
figure;
plot(t, original_signal); hold on;
plot(t, noisy_signal);
plot(t, filtered_signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Comparison: Original vs Noisy vs Filtered');
legend('Original','Noisy','Filtered');

% -------------------------
% Simple Evaluation Metrics
% -------------------------
% SNR before/after filtering (approx)
signal_power = mean(original_signal.^2);
noise_power_before = mean((noisy_signal - original_signal).^2);
noise_power_after  = mean((filtered_signal - original_signal).^2);

snr_before = 10*log10(signal_power / noise_power_before);
snr_after  = 10*log10(signal_power / noise_power_after);

fprintf('\n--- Parameters ---\n');
fprintf('fs = %d Hz\n', fs);
fprintf('Signal frequency = %.2f Hz\n', f_signal);
fprintf('Noise std = %.3f\n', noise_std);
fprintf('Cutoff frequency = %.2f Hz\n', cutoff_frequency);
fprintf('Filter order = %d\n', filter_order);

fprintf('\n--- Evaluation ---\n');
fprintf('SNR before filtering  = %.2f dB\n', snr_before);
fprintf('SNR after filtering   = %.2f dB\n', snr_after);
fprintf('Noise power before    = %.4f\n', noise_power_before);
fprintf('Noise power after     = %.4f\n\n', noise_power_after);