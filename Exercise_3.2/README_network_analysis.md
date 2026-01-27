# Network Parameter Exploration — Cellular (NetMonster) & Wi‑Fi (NET Analyzer)

This README documents measurements collected in three physical locations (**bedroom**, **kitchen**, **outside of the apartment**) using:
- **NetMonster** for **cellular (LTE/5G)** parameters
- **NET Analyzer** for **Wi‑Fi** parameters

---

## Part A — Cellular Network (NetMonster)

### Objective
Explore and analyze cellular network parameters and how they change with location.

### Device & Network
- **Phone:** Samsung Galaxy S21
- **Operator:** DNA (Finland)
- **Observed technology:** **4G LTE with Carrier Aggregation**  
  - Displayed as: **LTE 1800 + 1800 + 2100 + 2100**
- **5G:** **NSA — Disconnected** during all measurements

### Parameters (assignment mapping)
- **Signal strength:** RSSI, RSRP  
- **Signal quality:** RSRQ, SNR (used as SINR-like quality indicator)  
- **Cell ID:** CI (Cell Identifier), CID, eNb  
- **Carrier frequency:** EARFCN  
- **Bandwidth:** BW  

### Recorded values by location

#### Bedroom (08:05)
- **Cell / IDs:** CI **10449982**, eNb **40820**, CID **62**, TAC **37922**, PCI **356**
- **Carrier frequency:** EARFCN **1549**
- **Bandwidth:** **20 MHz**
- **Signal strength:** RSSI **-57 dBm**, RSRP **-95 dBm**
- **Signal quality:** RSRQ **-16 dB**, SNR **13 dB**

#### Kitchen (08:10)
- **Cell / IDs:** CI **10449982**, eNb **40820**, CID **62**, TAC **37922**, PCI **356**
- **Carrier frequency:** EARFCN **1549**
- **Bandwidth:** **20 MHz**
- **Signal strength:** RSSI **-61 dBm**, RSRP **-97 dBm**
- **Signal quality:** RSRQ **-14 dB**, SNR **14 dB**

#### Outside of the apartment (08:15)
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

### Observations & analysis (cellular)
- Bedroom and kitchen stayed on the **same cell/site** (same CI/eNb/CID/PCI). Changes were small and likely due to indoor propagation and interference.
- Outside showed a significant degradation in both **strength** and **quality**:
  - **RSRP:** -95 → -114 dBm (≈ 19 dB weaker)
  - **SNR:** 13 → 4 dB (≈ 9 dB worse)
- Expected impact:
  - Lower throughput (more robust modulation/coding, more retransmissions)
  - Higher latency/jitter, less stable connectivity
- Likely contributing factors:
  - Walls/building materials, orientation/hand effects
  - Interference/multipath, and changing cell load

---

## Part B — Wi‑Fi Network (NET Analyzer)

### Objective
Analyze the connected Wi‑Fi network and how performance changes with location.

### Router & gateway details (same in all locations)
- **SSID:** **DNA-WIFI-FD20**
- **BSSID (AP MAC):** **58:00:32:90:fd:22**
- **Vendor:** **Genexis B.V.**
- **Device IPv4:** **192.168.1.103**
- **Subnet mask:** **255.255.255.0**
- **Default gateway (router) IPv4:** **192.168.1.1**
- **DNS server IPv4:** **192.168.1.1**
- **IPv6:** enabled (IPv6 addresses present)
- **Default gateway IPv6:** **fe80::5a00:32ff:fe90:fd20**
- **DNS server IPv6:** **2001:14ba:9ca1:ff00::1**
- **DHCP lease time:** **12h**

### Wi‑Fi radio configuration (same in all locations)
- **Band:** 2.4 GHz
- **Operating channel:** **1 (2412 MHz)**
- **Standard:** **802.11n**
- **Max speed (Down/Up):** **300 / 300 Mbps** (link capability shown)

### Recorded values by location

#### Bedroom
- **Speed (Down/Up):** **5 / 26 Mbps**
- **Signal strength:** **-48 dBm** (strong)

#### Kitchen
- **Speed (Down/Up):** **5 / 43 Mbps**
- **Signal strength:** **-68 dBm** (medium)

#### Outside of the apartment
- **Speed (Down/Up):** **7 / 39 Mbps**
- **Signal strength:** **-74 dBm** (weaker)

### Latency (required)
The screenshots show throughput but not ping results. To include latency:
- Ping **gateway**: `192.168.1.1` (local Wi‑Fi)
- Ping a public host: `1.1.1.1` or `8.8.8.8` (internet path)
Record **avg ms** and **packet loss %**.

### Observations & troubleshooting (Wi‑Fi)
- Signal strength changes clearly by location (-48 → -74 dBm), but **download speed remains low (5–7 Mbps)** even with strong signal.
- This suggests the main limiter may be:
  - **2.4 GHz congestion** / channel contention
  - Interference (neighbors, Bluetooth, appliances)
  - Router/ISP-side constraints at measurement time

### Practical improvements
- **Channel planning:** choose the cleanest among **1 / 6 / 11** after scanning nearby networks
- Set **2.4 GHz channel width to 20 MHz** (better stability in crowded areas)
- Prefer **5 GHz (802.11ac/ax)** if available for higher speed and less interference
- **Router placement:** central, elevated, away from metal objects/appliances
- For outdoor coverage: consider a **mesh node/extender**
- Security: prefer **WPA2-AES or WPA3**, disable **WPS** if enabled

---

## Conclusions (key findings)
- **Cellular:** Indoors stayed on the same LTE cell with minor variation, while outdoors showed a large drop in **RSRP** and **SNR**, implying reduced speed and stability.
- **Wi‑Fi:** Signal strength decreases with distance/walls, but low download speeds across locations point toward **2.4 GHz congestion or non-signal bottlenecks**. Moving to 5 GHz and optimizing channel/router placement are the most practical improvements.
