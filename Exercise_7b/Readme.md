# Adding and Removing Noise from a Signal (MATLAB)

## Objective
To simulate the process of adding Gaussian white noise to a sinusoidal signal and removing the noise using a low-pass filter in MATLAB.

## Overview
This experiment demonstrates:
- How noise affects a clean sinusoidal signal in the time domain
- How a low-pass Butterworth filter reduces high-frequency noise
- How signal quality improves after filtering (measured using SNR)

## Experiment Steps

### 1) Generate a Sinusoidal Signal
A sinusoidal signal is generated using:
- Sampling frequency: `fs = 1000 Hz`
- Signal frequency: `f_signal = 5 Hz`
- Amplitude: `1`
- Duration: `1 second`

### 2) Add Gaussian White Noise
Gaussian white noise is added using `randn()`:
- Noise level is controlled using `noise_std`
- Noisy signal = Original signal + Noise

### 3) Remove Noise using a Low-pass Filter
A Butterworth low-pass filter is used to remove high-frequency noise:
- Filter type: Butterworth low-pass
- Default cutoff frequency: `cutoff_frequency = 10 Hz`
- Filter order: `filter_order = 4`
- Filtering is applied using `filtfilt()` to avoid phase distortion.

### 4) Plot Results
The script produces the following plots:
1. Original sinusoidal signal (time domain)
2. Noisy signal (time domain)
3. Filtered signal (time domain)
4. Combined comparison plot (Original vs Noisy vs Filtered)

## Evaluation / Results
To evaluate performance, the script computes:
- Noise power before filtering
- Noise power after filtering
- SNR before filtering (dB)
- SNR after filtering (dB)

Typically:
- SNR increases after filtering
- The filtered waveform looks smoother and closer to the original signal

## How to Run
1. Open MATLAB
2. Place the file `noise_add_remove.m` in your working folder
3. Run the script:
   - Click **Run** OR type:
     ```matlab
     noise_add_remove
     ```
4. View the generated plots and Command Window outputs

## Experimentation
Change these parameters in the code and observe the effect:
- `noise_std` (increase noise → signal becomes more distorted)
- `cutoff_frequency` (lower cutoff → smoother output but may distort signal)
- `f_signal` (higher signal frequency → may require higher cutoff to preserve signal)

## Files Included
- `noise_add_remove.m` — MATLAB script to generate, add noise, filter, plot, and evaluate
- Screenshots (recommended for submission):
  - Comparison plot (Original vs Noisy vs Filtered)
  - Command Window output showing SNR values

## Notes
- A low cutoff frequency can remove noise but may also reduce parts of the actual signal.
- A higher filter order can improve cutoff sharpness but may introduce instability if not used carefully.
