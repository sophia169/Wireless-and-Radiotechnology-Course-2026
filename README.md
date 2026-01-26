# Cellular Network Parameter Exploration (NetMonster) — Samsung Galaxy S21 (DNA Finland)

## Objective
Explore and analyze **cellular network parameters** using a smartphone “service-mode style” readout.  
Because the built-in Samsung ServiceMode screens were inconsistent on this device, measurements were collected using the **NetMonster** Android app, which exposes the same LTE/NR radio metrics.

## Device & Network
- **Phone:** Samsung Galaxy S21 (Android)
- **Operator:** DNA (Finland)
- **Radio technology observed:** **4G LTE with Carrier Aggregation**  
  - Displayed as: **LTE 1800 + 1800 + 2100 + 2100**
- **5G:** **NSA — Disconnected** (during all measurements)

## Parameters Collected (What to look for in NetMonster)
This section maps the assignment requirements to the fields shown in the app.

### 1) Signal Strength
- **RSSI (dBm):** Received signal strength indicator
- **RSRP (dBm):** Reference Signal Received Power (primary LTE signal strength metric)

### 2) Signal Quality
- **RSRQ (dB):** Reference Signal Received Quality (quality influenced by interference + cell load)
- **SNR (dB):** Signal-to-noise ratio (NetMonster shows **SNR**; conceptually similar to **SINR** — higher is better)

### 3) Cell ID
- **CI:** E-UTRAN Cell Identifier (main Cell ID)
- **CID:** Sector/cell number within the site (useful additional identifier)
- **eNb:** eNodeB ID (base station/site identifier)

### 4) Carrier Frequency
- **EARFCN:** LTE carrier channel number (used as “carrier frequency” indicator in LTE)

### 5) Bandwidth
- **BW:** Channel bandwidth (MHz)

---

## Data Collection Method
Measurements were taken under three different conditions:
1. **Bedroom (indoors)**
2. **Kitchen (indoors)**
3. **Outside apartment (outdoors)**

For each location, NetMonster live screen values were recorded consistently for:
- RSSI, RSRP, RSRQ, SNR
- CI, eNb, CID, TAC, PCI
- EARFCN and BW

---

## Recorded Values

### A) Bedroom (08:05)
- **Cell / IDs:** CI **10449982**, eNb **40820**, CID **62**, TAC **37922**, PCI **356**
- **Carrier frequency:** EARFCN **1549**
- **Bandwidth:** **20 MHz**
- **Signal strength:** RSSI **-57 dBm**, RSRP **-95 dBm**
- **Signal quality:** RSRQ **-16 dB**, SNR **13 dB**

### B) Kitchen (08:10)
- **Cell / IDs:** CI **10449982**, eNb **40820**, CID **62**, TAC **37922**, PCI **356**
- **Carrier frequency:** EARFCN **1549**
- **Bandwidth:** **20 MHz**
- **Signal strength:** RSSI **-61 dBm**, RSRP **-97 dBm**
- **Signal quality:** RSRQ **-14 dB**, SNR **14 dB**

### C) Outside apartment (08:15)
**Primary LTE carrier (top block):**
- **Cell / IDs:** CI **10449982**, eNb **40820**, CID **62**, TAC **37922**, PCI **356**
- **Carrier frequency:** EARFCN **1549**
- **Bandwidth:** **20 MHz**
- **Signal strength:** RSSI **-77 dBm**, RSRP **-114 dBm**
- **Signal quality:** RSRQ **-15 dB**, SNR **4 dB**

**Additional/secondary LTE carrier shown (lower block):**
- **Cell / IDs:** CI **10449992**, eNb **40820**, CID **72**, TAC **37922**, PCI **356**
- **Carrier frequency:** EARFCN **497**
- **Bandwidth:** **20 MHz**
- **Signal strength:** RSSI **-81 dBm**, RSRP **-118 dBm**
- **Signal quality:** RSRQ **-15 dB**, SNR **3 dB**

---

## Observations (How parameters changed)
### Indoors (Bedroom vs Kitchen)
- Bedroom and kitchen remained on the **same LTE cell/site** (same CI/eNb/CID/PCI).
- Differences were small:
  - **RSRP:** -95 (bedroom) vs -97 dBm (kitchen) → kitchen slightly weaker by ~2 dB
  - **SNR:** 13 (bedroom) vs 14 dB (kitchen) → kitchen slightly cleaner signal
  - **RSRQ:** -16 (bedroom) vs -14 dB (kitchen) → kitchen better quality

**Interpretation:** kitchen had slightly lower raw power but slightly better quality (less interference or better multipath conditions).

### Outdoors (Outside vs Bedroom/Kitchen)
- The device still saw the same main LTE cell (CI 10449982) but signal conditions worsened:
  - **RSRP:** -95 → **-114 dBm** (≈ 19 dB weaker)
  - **SNR:** 13 → **4 dB** (≈ 9 dB worse)
- NetMonster also displayed a secondary EARFCN (497), indicating additional carrier presence.

---

## Analysis: Impact on speed, stability, reliability
### 1) Data speed
- **Higher RSRP + higher SNR** generally enables higher modulation and coding (more bits per symbol) → **higher throughput**.
- The outdoor reading (**RSRP -114 dBm, SNR 4 dB**) is weak/noisy, so the network likely switches to more robust but slower modulation, increases error correction, and throughput drops.

### 2) Network stability (latency/jitter)
- Low **SNR** increases decoding errors → more retransmissions → higher latency and jitter.
- With **SNR ~3–4 dB outdoors**, the connection is more likely to feel unstable (buffering, slow page loads, inconsistent performance).

### 3) Connectivity reliability (dropouts)
- **RSRQ** around **-14 to -16 dB** suggests non-ideal quality (interference and/or higher cell load).
- Even if RSRP is acceptable, a poor RSRQ can reduce user experience and reliability.

---

## Factors to consider (Explaining the differences)
These help explain why measurements change across locations:

- **Distance to the tower:** further distance generally reduces RSRP and can reduce SNR.
- **Obstructions:** walls, floors, reinforced concrete, metal structures, and window coatings can attenuate signal and impact multipath.
- **Orientation/hand effects:** how the phone is held can change received signal by several dB.
- **Network load and interference:** busy cells can reduce RSRQ and SNR even if RSRP stays similar.
- **Environment/multipath:** reflections indoors vs outdoors can either help or harm (sometimes an indoor spot near a window can outperform an outdoor spot on the “shadowed” side of the building).

---

## Conclusion
Using NetMonster, LTE network parameters were recorded in three conditions.  
Indoor measurements showed modest variation while staying on the same cell. Outdoors, both **signal strength (RSRP)** and **signal quality (SNR)** degraded significantly, which would be expected to reduce speed and increase instability. The data supports the general relationship:

- **Stronger signal + cleaner quality ⇒ better speed + stability**
- **Weaker signal + noisier quality ⇒ slower, less reliable connectivity**

