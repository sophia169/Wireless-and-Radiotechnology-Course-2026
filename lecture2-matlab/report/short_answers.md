# Short Answers (Lecture-2)

 

## Q1 - Difference between time domain and frequency domain

Time domain shows how a signal’s amplitude changes over time x(t).
Frequency domain shows what sinusoidal components make up the signal (magnitude vs frequency).
In time domain you see waveform shape, peaks, and timing.
In frequency domain you see tones, bandwidth, harmonics, and where energy is concentrated.
FFT converts a sampled time signal into its frequency spectrum.
 

## Q2 - Why filtering helps in RF receivers

Filtering selects the wanted band/channel and rejects out-of-band interference.
It improves SNR by reducing noise and unwanted signals before amplification/demodulation.
It prevents strong adjacent signals from overloading or saturating receiver stages.
It also helps anti-aliasing before ADC in digital receivers.
 

## Q3 - What modulation achieves in an RF system

Modulation shifts a low-frequency (baseband) signal to a high-frequency carrier for transmission. It enables efficient antenna size and better radiation at RF. It allows multiple users/channels by assigning different carrier frequencies (frequency multiplexing). It can improve robustness to noise/interference depending on modulation scheme.


## Q4 - From A2: which filter was easiest to design and why?

The easiest was the HPF for “700 Hz and 800 Hz”. Because we only needed one cutoff between 600 and 700 Hz (e.g., 650 Hz). Everything above passes (700 & 800), everything below is attenuated (500 & 600). No narrow tuning was needed like a band-pass “single tone only” case.


## Q5 - From A3: where do the new frequency components appear after modulation?

After multiplication 𝑠(𝑡)= 𝑚(𝑡)cos(2𝜋𝑓𝑐𝑡), the spectrum shifts to sidebands.
New components appear at fc ± fm
​With 𝑓𝑐=2000 Hz and fm = 100Hz → peaks at 1900 Hz and 2100 Hz.
(And in a full FFT you’d also see symmetric components at negative frequencies.)
