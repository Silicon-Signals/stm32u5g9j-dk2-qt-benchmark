import QtQuick

Rectangle {
    id: textScroll
    width: 800
    height: 480
    color: "#FFFFFF"

    signal showResultScreen

    Flickable {
        id: verticalView
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick
        boundsBehavior: Flickable.StopAtBounds
        interactive: false

        Column {
            id: contentColumn
            width: parent.width

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 44
                font.family: "Calibri"
                color: "#000000"
                text: "STM32U5G9J-DK2"
                font.bold: true
            }

            // simple syntax for multiline text
            Text {
                width: parent.width
                font.pixelSize: 25
                text: `
          The STM32U5G9J-DK2 Discovery kit is a complete demonstration and
development platform for the STM32U5G9ZJT6Q microcontroller, featuring
an Arm® Cortex®-M33 core with Arm® TrustZone®.

          Leveraging the innovative ultra-low power-oriented features, 3 Mbytes
of embedded SRAM, 4 Mbytes of embedded flash memory, and rich graphics
features, the STM32U5G9J-DK2 Discovery kit enables users to prototype
applications with state-of-the-art energy efficiency, as well as providing
stunning and optimized graphics rendering with the support of a 2.5D Neo-
Chrom accelerator, Chrom-ART Accelerator, and Chrom-GRC™ MMU.

          The STM32U5G9J-DK2 Discovery kit integrates a full range of hardware
features that help the user evaluate all the peripherals, such as a 5" RGB 800x
480 pixels TFT colored LCD module with a 24-bit RGB interface and capacitive
touch panel, USB Type-C® HS, Octo-SPI flash memory device, ARDUINO®, and
STLINK-V3EC (USART console).

          The STM32U5G9J-DK2 Discovery kit integrates an STLINK-V3EC embedded
in-circuit debugger and programmer for the STM32 microcontroller with a
USB Virtual COM port bridge and comes with the STM32CubeU5 MCU Package,
which provides an STM32 comprehensive software HAL library as well as
various software examples.

          Ultra-low-power STM32U5G9ZJT6Q microcontroller based on the Arm®
Cortex®-M33 core with Arm® TrustZone®, featuring 4 Mbytes of flash
memory, 3 Mbytes of SRAM, and SMPS, in an LQFP144 package.

          Support for the NeoChrom VG GPU New processing unit optimizes
of vector graphics and animations such as flips, spins, scaling and more,
rendering vastly increasing the number of frames per second - fully
integrated in X-CUBE-TOUCHGFX.

          The STM32U5G9J-DK Discovery 2 kit relies on an HSE oscillator (16 MHz
crystal) and an LSE oscillator (32.768 kHz crystal) as clock references. Using
the HSE (instead of HSI) is mandatory to manage the DSI interface for the LCD
module and the USB high-speed interface.

          The STM32U5G9J Discovery 2 kit has up to 4 USARTs, 2 UARTs, and 1
LPUART. The Zephyr console output is assigned to USART1 which connected to
the onboard ST-LINK/V3.0 Virtual COM port interface. Default communication
settings are 115200 8N1.

          The demonstration software, included in the STM32Cube MCU Package
corresponding to the on-board microcontroller, is preloaded in the STM32
flash memory for easy demonstration of the device peripherals in standalone
mode. The latest versions of the demonstration source code and associated
documentation can be downloaded from www.st.com.`
                font.family: "Calibri"
                wrapMode: Text.WordWrap  // Enable word wrapping for better readability
            }
        }
    }

    SequentialAnimation {
        id: smoothScroll
        running: true
        loops: Animation.Infinite

        NumberAnimation {
            target: verticalView
            property: "contentY"
            from: 0
            to: Math.max(0, contentColumn.height - verticalView.height)
            duration: 4500
            easing.type: Easing.Linear
        }

        PauseAnimation {
            duration: 500
        }

        NumberAnimation {
            target: verticalView
            property: "contentY"
            from: Math.max(0, contentColumn.height - verticalView.height)
            to: 0
            duration: 4500
            easing.type: Easing.Linear
        }

        PauseAnimation {
            duration: 500
        }
    }

    Timer {
        id: stopTimer
        interval: 10000
        running: true
        repeat: false
        onTriggered: {
            showResultScreen();
        }
    }
}
