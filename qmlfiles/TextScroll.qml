import QtQuick
import QtQuick.Controls

Item {
    id: textScroll
    width: 800
    height: 480

    signal showResultScreen()

    property string scroll1: "\n          The STM32U5G9J-DK2 Discovery kit is a complete demonstration and"
    property string scroll2: " development platform for the STM32U5G9ZJT6Q microcontroller, featuring"
    property string scroll3: " an Arm® Cortex®-M33 core with Arm® TrustZone®.\n\n"
    property string scroll4: "          Leveraging the innovative ultra-low power-oriented features, 3 Mbytes "
    property string scroll5: "of embedded SRAM, 4 Mbytes of embedded flash memory, and rich graphics "
    property string scroll6: "features, the STM32U5G9J-DK2 Discovery kit enables users to prototype "
    property string scroll7: "applications with state-of-the-art energy efficiency, as well as providing "
    property string scroll8: "stunning and optimized graphics rendering with the support of a 2.5D Neo-"
    property string scroll9: "Chrom accelerator, Chrom-ART Accelerator, and Chrom-GRC™ MMU.\n\n"
    property string scroll10: "          The STM32U5G9J-DK2 Discovery kit integrates a full range of hardware "
    property string scroll11: "features that help the user evaluate all the peripherals, such as a 5\" RGB 800x "
    property string scroll12: "480 pixels TFT colored LCD module with a 24-bit RGB interface and capacitive "
    property string scroll13: "touch panel, USB Type-C® HS, Octo-SPI flash memory device, ARDUINO®, and "
    property string scroll14: "STLINK-V3EC (USART console).\n\n"
    property string scroll15: "          The STM32U5G9J-DK2 Discovery kit integrates an STLINK-V3EC embedded "
    property string scroll16: "in-circuit debugger and programmer for the STM32 microcontroller with a "
    property string scroll17: "USB Virtual COM port bridge and comes with the STM32CubeU5 MCU Package, "
    property string scroll18: "which provides an STM32 comprehensive software HAL library as well as "
    property string scroll19: "various software examples.\n\n"
    property string scroll20: "          Ultra-low-power STM32U5G9ZJT6Q microcontroller based on the Arm® "
    property string scroll21: "Cortex®-M33 core with Arm® TrustZone®, featuring 4 Mbytes of flash "
    property string scroll22: "memory, 3 Mbytes of SRAM, and SMPS, in an LQFP144 package.\n\n"
    property string scroll23: "        Support for the NeoChrom VG GPU New processing unit optimizes "
    property string scroll24: "of vector graphics and animations such as flips, spins, scaling and more, "
    property string scroll25: "rendering vastly increasing the number of frames per second - fully "
    property string scroll26: "integrated in X-CUBE-TOUCHGFX.\n\n"
    property string scroll27: "          The STM32U5G9J-DK Discovery 2 kit relies on an HSE oscillator (16 MHz "
    property string scroll28: "crystal) and an LSE oscillator (32.768 kHz crystal) as clock references. Using "
    property string scroll29: "the HSE (instead of HSI) is mandatory to manage the DSI interface for the LCD "
    property string scroll30: "module and the USB high-speed interface.\n\n"
    property string scroll31: "          The STM32U5G9J Discovery 2 kit has up to 4 USARTs, 2 UARTs, and 1 "
    property string scroll32: "LPUART. The Zephyr console output is assigned to USART1 which connected to "
    property string scroll33: "the onboard ST-LINK/V3.0 Virtual COM port interface. Default communication "
    property string scroll34: "settings are 115200 8N1.\n\n"
    property string scroll35: "          The demonstration software, included in the STM32Cube MCU Package "
    property string scroll36: "corresponding to the on-board microcontroller, is preloaded in the STM32 "
    property string scroll37: "flash memory for easy demonstration of the device peripherals in standalone "
    property string scroll38: "mode. The latest versions of the demonstration source code and associated "
    property string scroll39: "documentation can be downloaded from www.st.com."

    Rectangle {
        anchors.fill: parent
        color: "#FFFFFF"

        Flickable {
            id: verticalView
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: contentColumn.height
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            interactive: false
            clip: true

            Column {
                id: contentColumn
                width: parent.width

                Text {
                    width: parent.width
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 44
                    font.family: "Calibri"
                    color: "#000000"
                    text: "STM32U5G9J-DK2"
                    font.bold: true
                }

                // Add each chunk as separate Text items
                Text { width: parent.width; font.pixelSize: 25; text: scroll1; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll2; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll3; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll4; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll5; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll6; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll7; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll8; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll9; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll10; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll11; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll12; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll13; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll14; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll15; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll16; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll17; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll18; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll19; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll20; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll21; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll22; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll23; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll24; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll25; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll26; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll27; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll28; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll29; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll30; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll31; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll32; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll33; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll34; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll35; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll36; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll37; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll38; font.family: "Calibri" }
                Text { width: parent.width; font.pixelSize: 25; text: scroll39; font.family: "Calibri" }
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

        PauseAnimation { duration: 500 }

        NumberAnimation {
            target: verticalView
            property: "contentY"
            from: Math.max(0, contentColumn.height - verticalView.height)
            to: 0
            duration: 4500
            easing.type: Easing.Linear
        }

        PauseAnimation { duration: 500 }
    }

    Timer {
        id: stopTimer
        interval: 10000
        running: true
        repeat: false
        onTriggered: {
            showResultScreen()
        }
    }
}
