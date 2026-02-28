clc;
close all;
clear;

% -------------------------
% Thermal Noise Assignment
% -------------------------
% Default parameters (you can change these OR use the input prompts)
B = 1e6;      % Bandwidth (Hz) = 1 MHz
R = 100;      % Resistance (ohms)
T = 300;      % Temperature (K)
k = 1.38e-23; % Boltzmann constant (J/K)

% OPTIONAL: Uncomment these if your teacher wants user input
% B = input('Enter Bandwidth B in Hz (e.g., 1e6) = ');
% R = input('Enter Resistance R in ohms (e.g., 100) = ');
% T = input('Enter Temperature T in K (e.g., 300) = ');

% Generate thermal noise
n_samples = 10000;
Fs = B;                          % sampling frequency (use B as given in template)
t = (0:n_samples-1)/Fs;          % time axis

% Thermal noise voltage samples (RMS based on 4kTRB)
thermal_noise = sqrt(4*k*T*R*B) * randn(1, n_samples);

% -------------------------
% 1) Time-domain Plot
% -------------------------
figure;
plot(t, thermal_noise);
grid on;
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Thermal Noise in Time Domain');

% Print basic observation values
fprintf('\n--- Thermal Noise Parameters ---\n');
fprintf('Bandwidth B   = %.3e Hz\n', B);
fprintf('Resistance R  = %.2f ohms\n', R);
fprintf('Temperature T = %.2f K\n', T);
fprintf('Samples       = %d\n', n_samples);

fprintf('\n--- Noise Statistics ---\n');
fprintf('Mean(V)  = %.3e V\n', mean(thermal_noise));
fprintf('Std(V)   = %.3e V\n', std(thermal_noise));
fprintf('Vrms(th) = %.3e V (theoretical)\n', sqrt(4*k*T*R*B));

% -------------------------
% 2) PSD using Welch Method
% -------------------------
% Use pwelch to estimate power spectral density
[psd, freq] = pwelch(thermal_noise, [], [], [], Fs);

figure;
semilogx(freq, 10*log10(psd));
grid on;
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');
title('Power Spectral Density (PSD) of Thermal Noise (Welch)');

% -------------------------
% 3) Experimentation Hint
% -------------------------
fprintf('\n--- Experimentation ---\n');
fprintf('Try changing B, R, and T and re-run:\n');
fprintf('- Increasing B increases noise power (higher Vrms)\n');
fprintf('- Increasing R increases noise power\n');
fprintf('- Increasing T increases noise power\n\n');