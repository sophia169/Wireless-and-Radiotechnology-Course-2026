% A2: Filtering a multi-tone signal (Butterworth baseline)
% Student: Trang Dinh
% Student ID: 2326172

clear; close all; clc;

%% 1) Create time vector
Fs = 10000;
T  = 0.2;                 % longer duration = better frequency resolution
t  = 0:1/Fs:T-1/Fs;

%% 2) Create Vin(t)
Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t) ...
    + 3*sin(2*pi*700*t) ...
    + 5*sin(2*pi*800*t);

%% Parameters for FFT plotting
xlim_max = 1200;
before_name = 'A2_before.png';

%% Helper: plot spectrum and export
plot_and_export_spectrum(Vin, Fs, xlim_max, ...
    'A2: Spectrum BEFORE filtering', before_name);

%% Butterworth order (simple baseline)
Norder = 4;     % filtfilt makes it effectively steeper (zero-phase)

%% -------------------------------
% Case 1: 500 Hz only  (use BPF around 500)
% -------------------------------
bp1 = 450; bp2 = 550;                 % passband around 500 Hz
[b,a] = butter(Norder, [bp1 bp2]/(Fs/2), 'bandpass');
y500 = filtfilt(b,a,Vin);

plot_and_export_spectrum(y500, Fs, xlim_max, ...
    sprintf('A2: AFTER BPF (target 500 Hz) [%d-%d Hz]', bp1, bp2), ...
    'A2_after_500.png');

%% -------------------------------
% Case 2: 800 Hz only (use BPF around 800)
% -------------------------------
bp1 = 750; bp2 = 850;                 % passband around 800 Hz
[b,a] = butter(Norder, [bp1 bp2]/(Fs/2), 'bandpass');
y800 = filtfilt(b,a,Vin);

plot_and_export_spectrum(y800, Fs, xlim_max, ...
    sprintf('A2: AFTER BPF (target 800 Hz) [%d-%d Hz]', bp1, bp2), ...
    'A2_after_800.png');

%% -------------------------------
% Case 3: 600 Hz only (use BPF around 600)
% -------------------------------
bp1 = 550; bp2 = 650;                 % passband around 600 Hz
[b,a] = butter(Norder, [bp1 bp2]/(Fs/2), 'bandpass');
y600 = filtfilt(b,a,Vin);

plot_and_export_spectrum(y600, Fs, xlim_max, ...
    sprintf('A2: AFTER BPF (target 600 Hz) [%d-%d Hz]', bp1, bp2), ...
    'A2_after_600.png');

%% -------------------------------
% Case 4: 700 Hz and 800 Hz (use HPF cutoff between 600 and 700)
% -------------------------------
cutoff = 650;                          % keep 700 & 800, remove 500 & 600
[b,a] = butter(Norder, cutoff/(Fs/2), 'high');
y700_800 = filtfilt(b,a,Vin);

plot_and_export_spectrum(y700_800, Fs, xlim_max, ...
    sprintf('A2: AFTER HPF (target 700 & 800 Hz), cutoff = %d Hz', cutoff), ...
    'A2_after_700_800.png');

%% -------------------------------
% Local function(s)
% -------------------------------
function plot_and_export_spectrum(x, Fs, xlim_max, plotTitle, fileName)
    N = length(x);

    % FFT
    X = fft(x);

    % Single-sided spectrum
    halfN = floor(N/2) + 1;
    f = (0:halfN-1) * (Fs/N);

    mag = abs(X(1:halfN)) / N;     % normalize by N
    mag(2:end-1) = 2*mag(2:end-1); % single-sided correction (except DC/Nyquist)

    figure;
    plot(f, mag, 'LineWidth', 1.2);
    grid on;
    xlabel('Frequency [Hz]');
    ylabel('Magnitude');
    title(plotTitle);
    xlim([0 xlim_max]);

    exportgraphics(gcf, fileName, 'Resolution', 200);
end
