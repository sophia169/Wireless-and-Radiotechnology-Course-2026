% A1: Time domain and frequency components (FFT)
% Student: <Name>
% Student ID: <ID>

clear; close all; clc;

%% 1) Create time vector
Fs = 10000;             % sampling frequency [Hz]
T  = 0.05;              % duration [s] (50 ms)
t  = 0:1/Fs:T-1/Fs;     % time vector
N  = length(t);

%% 2) Create the signal Vin(t) in mV
Vin = 10*sin(2*pi*500*t) ...
    +  5*sin(2*pi*600*t) ...
    +  3*sin(2*pi*700*t) ...
    +  5*sin(2*pi*800*t);   % [mV]

%% 3) Plot time domain (first 10 ms)
t_ms = t * 1000;               % convert to ms
idx  = (t_ms <= 10);           % 0..10 ms

figure;
plot(t_ms(idx), Vin(idx), 'LineWidth', 1.2);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude [mV]');
title('A1: Time Domain of V_{in}(t) (first 10 ms)');
exportgraphics(gcf, 'A1_time.png', 'Resolution', 200);

%% 4) FFT (frequency analysis) - single-sided amplitude spectrum
X = fft(Vin);

% Two-sided magnitude normalized by N
P2 = abs(X) / N;

% Single-sided spectrum (keep DC..Nyquist)
P1 = P2(1:floor(N/2)+1);

% Double all bins except DC (and Nyquist if N even)
P1(2:end-1) = 2*P1(2:end-1);

% Frequency axis for single-sided spectrum
f = Fs*(0:floor(N/2))/N;

figure;
plot(f, P1, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Amplitude [mV]');
title('A1: Single-Sided FFT Amplitude Spectrum');
xlim([0 1200]);

% Mark and label the required peaks
hold on;
targetFreqs = [500 600 700 800];
for k = 1:numel(targetFreqs)
    [~, bin] = min(abs(f - targetFreqs(k)));
    plot(f(bin), P1(bin), 'o', 'LineWidth', 1.5);
    text(f(bin)+15, P1(bin), sprintf('%d Hz', targetFreqs(k)));
end
hold off;

exportgraphics(gcf, 'A1_spectrum.png', 'Resolution', 200);
