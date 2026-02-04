% A3: Basic modulation by multiplication (beginner version)
% Student: Trang Dinh
% Student ID: 2326172

clear; close all; clc;

%% 1) Time vector
Fs = 20000;
T  = 0.1;
t  = 0:1/Fs:T-1/Fs;

%% 2) Baseband and carrier
fm = 100;        % message frequency [Hz]
fc = 2000;       % carrier frequency [Hz]

m = sin(2*pi*fm*t);      % baseband (message), amplitude 1
c = cos(2*pi*fc*t);      % carrier

%% 3) Modulated signal (passband)
s = m .* c;              % DSB-SC AM-style multiplication

%% 4) Plot baseband time domain
figure;
plot(t*1000, m, 'LineWidth', 1.2);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
title('A3: Baseband m(t) = sin(2\pi f_m t)');
xlim([0 50]);  % show first 50 ms clearly
exportgraphics(gcf, 'A3_baseband_time.png', 'Resolution', 200);

%% 5) Plot passband time domain (zoom first 5 ms)
index = (t <= 0.005);

figure;
plot(t(index)*1000, s(index), 'LineWidth', 1.2);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
title('A3: Passband s(t) = m(t)\cdotcos(2\pi f_c t)');
exportgraphics(gcf, 'A3_passband_time.png', 'Resolution', 200);

%% 6) FFT for baseband (single-sided magnitude)
N = length(m);

M = fft(m);

halfN = floor(N/2) + 1;
f_half = (0:halfN-1) * (Fs/N);

mag_m = abs(M(1:halfN)) / N;
mag_m(2:end-1) = 2*mag_m(2:end-1);   % single-sided correction

figure;
plot(f_half, mag_m, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A3: Spectrum of Baseband m(t)');
xlim([0 1000]);
exportgraphics(gcf, 'A3_baseband_spectrum.png', 'Resolution', 200);

%% 7) FFT for modulated signal (single-sided magnitude)
S = fft(s);

mag_s = abs(S(1:halfN)) / N;
mag_s(2:end-1) = 2*mag_s(2:end-1);   % single-sided correction

figure;
plot(f_half, mag_s, 'LineWidth', 1.2);
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A3: Spectrum of Modulated Signal s(t)');
xlim([0 5000]);
exportgraphics(gcf, 'A3_passband_spectrum.png', 'Resolution', 200);

%% Expected observation (write in report):
% - Baseband spectrum has peaks at ~100 Hz (and symmetric negative freq in full FFT)
% - Modulated spectrum has peaks at fc ± fm ≈ 2000 ± 100 => 1900 Hz and 2100 Hz
