# Frequency Component Isolation Filters

This project provides recommended digital filter configurations to isolate specific frequency components from an input signal. For each target component (or set of components), the project selects an appropriate filter type and practical cutoff frequency/frequencies.

## Overview

Given an input signal containing the frequency components:

- **100 Hz**
- **200 Hz**
- **300 Hz**
- **400 Hz**

we choose filter cutoffs placed halfway between adjacent components to cleanly separate them:

- Between **100 Hz** and **200 Hz** → **150 Hz**
- Between **200 Hz** and **300 Hz** → **250 Hz**
- Between **300 Hz** and **400 Hz** → **350 Hz**

These midpoint cutoffs help ensure the desired components are passed while nearby unwanted components are attenuated.

## Filter Types Used

- **Low Pass (LPF):** Passes frequencies below a cutoff.
- **High Pass (HPF):** Passes frequencies above a cutoff.
- **Band Pass (BPF):** Passes frequencies within a lower–upper range.
- **Band Stop (BSF / Notch):** Rejects frequencies within a lower–upper range.

## Recommended Filter Settings

| Target Frequency Component(s) | Filter Type | Cutoff Frequency/Frequencies |
|---|---|---|
| 100 Hz | Low Pass | 150 Hz |
| 400 Hz | High Pass | 350 Hz |
| 100 Hz and 200 Hz | Low Pass | 250 Hz |
| 200 Hz | Band Pass | 150–250 Hz |
| 300 Hz | Band Pass | 250–350 Hz |
| 300 Hz and 400 Hz | High Pass | 250 Hz |
| 200 Hz and 300 Hz | Band Pass | 150–350 Hz |
| 200 Hz, 300 Hz, and 400 Hz | High Pass | 150 Hz |
| 100 Hz and 400 Hz | Band Stop (Notch) | 150–350 Hz |

## Notes / Assumptions

- Cutoffs are chosen as **midpoints** between known discrete components to maximize separation.
- In real implementations, results depend on:
  - Filter order (steepness)
  - Ripple/attenuation requirements
  - Sample rate and normalization (e.g., cutoff / Nyquist)
- If two components are far apart (e.g., **100 Hz and 400 Hz**), a **Band Stop** filter rejecting the middle band is a straightforward way to isolate both ends.

## How to Use

1. Identify which frequency component(s) you want to isolate.
2. Select the corresponding **Filter Type**.
3. Use the listed **cutoff frequency/frequencies** in your DSP tool/library (MATLAB, Python SciPy, etc.).
4. Choose filter order/type (Butterworth, Chebyshev, FIR windowed, etc.) based on your required sharpness and stability.

