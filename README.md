# STM32U5G9J-DK2 Qt Benchmark Project

This project is used to generate **benchmark results (Matrices)** on the **STM32U5G9J-DK2** board using **Qt for MCUs**.

---

## Disclaimer

This repository contains **QML application code and STM32U5 platform adaptation code** provided by **Silicon Signals** for benchmarking purposes.

The modifications and changes made on top of the original **Qt for MCUs sources** are **not the responsibility of The Qt Company**.

To build this project, a **valid Qt for MCUs license** is required. Without a valid license, the QML application cannot be compiled.

Users who do not have a license can request a **free evaluation license** from Qt:

https://www.qt.io/development/download

Pre-built binaries are provided in this repository so users can run the benchmark directly on the board without compiling the project.

---

## Clone the Repository

Clone this repository using:
 
```bash
$ git clone https://github.com/Silicon-Signals/stm32u5g9j-dk2-qt-benchmark.git
```
Or download the **ZIP file** from GitHub

---

## 1. Required Software

Install the following software before starting.

- **Operating System:** Windows
- **Qt Creator**
- **Qt for MCUs**

⚠️ **Important:**  
A **valid Qt for MCUs license** is required. The project will not build without a license.

---

## 2. Get Qt for MCUs License

Install the **Qt Maintenance Tool** and activate your license.

Follow this guide:  
https://doc.qt.io/qtlicenseserver/qls-how-to-install-service.html

---

## 3. Install Qt for MCUs and SDK

Follow the official Qt for MCUs installation guide:

https://doc.qt.io/QtForMCUs/index.html

During installation, make sure to install the **STM32U5G9J-DK2 SDK with FreeRTOS**.

---

## 4. STM32U5G9J-DK2 Benchmarking Patch Guide

This provides patches required to generate benchmarking (Matrices) results on the **STM32U5G9J-DK2** platform using the Qt for MCUs SDK.

This patch is **only compatible with**: **stm32u5x9-discovery-freertos-2.11.1**

⚠️ Using another SDK version may cause **build errors**.

---

## 5. Apply Required Patches

Two patches must be applied to the SDK. The patch files are available in the **Patch** folder.

It is recommended to **apply patches manually** to avoid conflicts.

### Patch 1: Platform File Patch
- **Patch File:** `0001-PATCH-1-Platform-file-patch`
- **Target Path:** stm32u5x9-discovery-freertos-2.11.1/platform/boards/st

### Patch 2: Source Folder Patch
- **Patch File:** `0002-PATCH-2-Src-folder-patch`
- **Target Path:** stm32u5x9-discovery-freertos-2.11.1/src

---

## 6. Rebuild the SDK

After applying the patches, rebuild the SDK.

⚠️ You may need to update file paths in the sdk_rebuild.bat.

Run the following command:

```bash
./sdk_rebuild.bat
```

---

## 7. SetUp and Run the Project
 
- **Open Project in Qt Creator**
 
  - Open Qt Creator IDE, click “Open Project” on the Welcome screen, and select the **CMakeLists.txt** file inside the stm32u5g9j-dk2-qt-benchmark project folder to open project.
 
- **Configure Kit**
 
  - Create a Qt Creator Kit using the Qt for MCUs SDK that you rebuilt.
 
  - Provide the required SDK paths during kit setup.
 
  - After configuration completes, the project will appear in the Projects panel.
 
- **Build and Run**
 
  - Click the **Run button** (bottom left) or press:**Ctrl + R** to build and run the project.
 
  - Once flashing is complete, the UI will appear on the board display.
 
---

## 8. Run Pre-built Binary (Optional)

If you do not want to build the project, you can directly use the **pre-built binary**.

Flash the binary using **STM32CubeProgrammer**.

The binary file are available in the **Pre-build Binary.zip**.

Flash these files to the board using STM32CubeProgrammer to run the project.
