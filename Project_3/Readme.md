# BLE / Wi-Fi SoC Overview: nRF52832 and ESP32
Student name and ID: Trang Dinh, 2326172

Selected device name:  BLE SoC 

- Nordic nRF52832 / nRF52840

- ESP32 (any variant)

Datasheet link:
https://docs.nordicsemi.com/bundle/nRF52832_PS_v1.9/resource/nRF52832_PS_v1.9.pdf?utm_source=chatgpt.com
https://documentation.espressif.com/esp32_datasheet_en.pdf

This repository/document summarizes two popular wireless SoCs:
- **Nordic nRF52832** (Bluetooth Low Energy / 2.4 GHz)
- **Espressif ESP32** (Wi-Fi + Bluetooth)

## 1) Nordic nRF52832 (BLE SoC)

### Role
The **nRF52832** is a low-power embedded system-on-chip designed mainly for **Bluetooth Low Energy (BLE)** applications. It combines an **ARM Cortex-M4** CPU (runs the firmware) with an integrated **2.4 GHz radio** for BLE communication.

### What happens to the signal in the RF block?
- **Transmit (TX):** Digital packets are formed by the protocol/packet engine, converted into a radio waveform, **upconverted** to 2.4 GHz, **amplified**, and sent out through the antenna pins (ANT1/ANT2 via matching network).
- **Receive (RX):** The antenna signal is **amplified**, **downconverted** to baseband, filtered/processed, **demodulated**, and converted back into digital packets for the CPU.

## 2) Espressif ESP32 (Wi-Fi + Bluetooth SoC)

### Role
The **ESP32** is a higher-performance SoC that supports both **Wi-Fi** and **Bluetooth** while also running user applications on **Xtensa** CPU core(s). It is commonly used for IoT devices that need Wi-Fi connectivity and rich peripheral support.

### What happens to the signal in the RF block?
- **Transmit (TX):** Wi-Fi/Bluetooth baseband generates the digital waveform, which is converted and **upconverted** to RF, **amplified**, and routed through the RF switch/balun to the antenna.
- **Receive (RX):** The incoming RF signal is routed from the antenna through matching/switching, **amplified**, **downconverted**, filtered, and converted back to digital baseband for Wi-Fi/Bluetooth processing.

## Notes
- The **RF front end** typically includes blocks such as PA/LNA, mixers, filters, PLL/clock generation, and antenna matching.
- Some diagram blocks can be combined for simplification (e.g., “Baseband + Mod/Demod”, “Synthesizer/PLL”, etc.).
