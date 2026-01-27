# BLE Scanning Report — Classroom vs Library (BLE Scanner App)

This README documents Bluetooth Low Energy (BLE) scan results collected in two environments:
- **classroom**
- **library**

The data was recorded using screenshots from the **BLE Scanner** Android app.

---

## Objective
Detect nearby BLE devices and analyze:
- Device name (if available)
- Signal strength (RSSI)
- MAC address or device identifier (if visible)

Then compare results across environments with emphasis on:
- Relationship between RSSI and estimated distance
- Number and types of BLE devices detected
- Patterns/inconsistencies/anomalies
- Security and privacy considerations

---

## Data Collection

### Recorded fields
From each detected BLE device entry:
- **Device name** (often shown as *N/A*)
- **Identifier** (MAC address/device ID as shown by the app)
- **RSSI (dBm)**
- **Apx Dist (m)** (estimated distance shown by the app)
- **Connectable status** (Connect / Non Connectable)

> Note: Many devices advertise without a readable name, so **Name = N/A** is common.

---

## Scan Results

### 1) Classroom (`classroom.jpeg`)
Devices visible in the screenshot:

| # | Device name | Identifier (MAC/ID) | RSSI (dBm) | Apx Dist (m) | Connectable |
|---|-------------|----------------------|-----------:|-------------:|------------|
| 1 | N/A | 7A:C6:E8:F9:C4:A9 | -71 | 3.98 | Yes |
| 2 | N/A | 75:C9:A8:C6:68:51 | -75 | 6.31 | Yes |
| 3 | N/A | 23:7F:20:6C:F9:D1 | -67 | 2.51 | Yes |
| 4 | N/A | 2E:A1:70:D0:FD:85 | -58 | 0.89 | No |
| 5 | N/A | 38:78:C4:6E:11:FE | -82 | 14.13 | No |

**Summary (classroom):**
- Devices recorded: **5**
- Connectable: **3**
- Non-connectable: **2**
- RSSI range: **-58 to -82 dBm**

---

### 2) Library (`library.jpeg`)
Devices visible in the screenshot:

| # | Device name | Identifier (MAC/ID) | RSSI (dBm) | Apx Dist (m) | Connectable |
|---|-------------|----------------------|-----------:|-------------:|------------|
| 1 | N/A | 09:45:AD:90:76:CA | -78 | 8.91 | No |
| 2 | N/A | 10:8A:D2:E3:86:AD | -64 | 1.78 | No |
| 3 | N/A | 1E:4C:66:AE:5E:CD | -77 | 7.94 | No |
| 4 | N/A | 18:20:25:A9:5E:FC | -74 | 5.62 | No |
| 5 | Polar mobile 59902529 | 5B:5F:31:7A:B8:5A | -79 | 10.00 | Yes |

**Summary (library):**
- Devices recorded: **5**
- Connectable: **1**
- Non-connectable: **4**
- RSSI range: **-64 to -79 dBm**

---

## Analysis

### Relationship between RSSI and estimated distance
Across both environments, the app’s distance estimate follows the expected trend:
- **Stronger RSSI (less negative)** → **shorter estimated distance**
- **Weaker RSSI (more negative)** → **longer estimated distance**

Examples:
- Classroom: **-58 dBm → 0.89 m**, **-82 dBm → 14.13 m**
- Library: **-64 dBm → 1.78 m**, **-78 to -79 dBm → 8.91–10.00 m**

However, RSSI-distance estimation is approximate and can be inconsistent due to:
- Different device **transmission power (Tx power)** and antenna designs
- **Obstructions** (people, walls, shelves)
- **Multipath reflections** (signals bouncing indoors)
- **2.4 GHz interference** (Wi‑Fi/Bluetooth co-existence)

### Number and types of devices by environment
- **Classroom:** Higher proportion of **connectable** devices (3/5). Likely more personal devices nearby (phones, wearables, laptops).
- **Library:** Mostly **non-connectable** advertisers (4/5), plus one identifiable wearable (**Polar**), suggesting fewer devices allow direct connections openly in that snapshot.

### Patterns / anomalies
- Many entries show **Name = N/A** despite being connectable. This is normal because device names are not always included in advertisements.
- Distance estimates differ substantially across devices at similar RSSI ranges due to different Tx power and environmental effects.

---

## Environmental factors influencing results
- **Transmission power:** high-Tx devices appear “closer” than low-power devices at the same physical distance.
- **Physical obstructions:** shelves/books and human bodies attenuate 2.4 GHz signals.
- **Environmental noise/interference:** BLE shares the 2.4 GHz band, so crowded Wi‑Fi environments can increase RSSI variability.

---

## Security & Privacy Considerations

### Everyday uses of BLE
- Wearables (fitness trackers, heart rate monitors)
- IoT sensors and smart home devices
- Beacons for indoor navigation/asset tracking
- Accessories (earbuds, keyboards, mice)

### Risks
- **Device tracking:** stable identifiers can allow repeated detection over time.
- **Identifier exposure:** advertisements can reveal device presence and sometimes device type.
- **Passive scanning:** attackers can learn who/what is nearby without pairing.

### Mitigations
- Many modern devices use **randomized/private addresses** to reduce tracking.
- Users can reduce exposure by turning off Bluetooth when not needed and limiting discoverability.

---

## Final Conclusion
BLE scanning in two environments detected multiple nearby devices, often without names but with visible identifiers and RSSI values. RSSI generally correlated with the app’s estimated distance, but real-world effects (Tx power differences, obstructions, multipath, and interference) introduced variability. The classroom snapshot showed more connectable devices, while the library snapshot showed mostly non-connectable advertisers plus one identifiable wearable (Polar). The results also highlight privacy considerations: BLE advertisements enable passive presence detection and can support tracking if identifiers remain stable.
