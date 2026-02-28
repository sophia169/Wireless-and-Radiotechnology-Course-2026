# Impact of Signal-to-Noise Ratio (SNR) on Communication System Performance

## Objective
To investigate how varying Signal-to-Noise Ratio (SNR) affects the demodulation performance of a communication system.

This experiment provides hands-on understanding of how noise influences the received and demodulated signals and highlights the trade-offs involved in communication system design.

---

## Experiment Description
In this experiment, a random binary message is generated and modulated using **Binary Amplitude Shift Keying (ASK)** (On-Off Keying style). Gaussian noise is added to the transmitted signal using different SNR values. The receiver then performs coherent demodulation and makes binary decisions to recover the transmitted message.

SNR values tested:
- **10 dB**
- **5 dB**
- **0 dB**
- **-5 dB**

---

## Steps Performed

### 1) Generate Binary Message Signal
A random binary message sequence is generated using:
- `message_signal = randi([0 1], 1, length(t));`

### 2) ASK Modulation
Binary ASK modulation is performed by multiplying the message with a carrier:
- Carrier frequency: `f_c = 50 Hz`
- `modulated_signal = message_signal .* cos(2*pi*f_c*t);`

### 3) Add AWGN Noise
Gaussian noise is added to the modulated signal using MATLAB’s `awgn()` function for each SNR value:
- `received_signal = awgn(modulated_signal, snr_db, 'measured');`

### 4) Demodulation (Coherent Detection)
The received signal is:
1. Mixed with the same carrier
2. Passed through a simple low-pass filter (moving average)
3. Compared against a threshold to detect bits (0 or 1)

### 5) Plotting
For each SNR value, the following are plotted:
- Transmitted ASK modulated signal
- Received signal after adding noise
- Demodulated baseband signal (with threshold line)

### 6) Evaluation (BER)
Bit Error Rate (BER) is computed for each SNR value:
- `BER = number_of_bit_errors / total_bits`

---

## Observations
- **Higher SNR (10 dB):** Received signal is cleaner, demodulation is accurate, BER is very low.
- **Medium SNR (5 dB):** Some noise is visible, but the signal can still be recovered with low BER.
- **Low SNR (0 dB):** Noise becomes significant; more bit errors occur and BER increases.
- **Very Low SNR (-5 dB):** Noise dominates the signal; demodulation performance degrades greatly and BER becomes high.

---

## Experimentation
You can modify these parameters to observe changes in performance:
- `f_c` (carrier frequency)
- `fs` (sampling frequency)
- `SNR_list` (test more SNR values)
- Threshold method (e.g., fixed value vs adaptive)
- Filter length/order (improve or degrade demodulation)

---

## How to Run
1. Open MATLAB.
2. Place the script file in your current working directory:
   - `snr_ask_demodulation.m`
3. Run the script:
   ```matlab
   snr_ask_demodulation
