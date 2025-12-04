import QtQuick
import QtQuickUltralite.Extras

Item {
    id: resultScreen
    width: 800
    height: 480

    signal backToMain

    Image {
        id: resultBG
        source: "images/result_bg.png"

        Image {
            id: homeButton
            x: 369
            y: 378
            source: "images/result_home_button.png"

            MouseArea {
                anchors.fill: parent
                onClicked: backToMain()
            }
        }

        Text {
            id: text1
            x: 165
            y: 154
            text: "Test"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
            font.bold: true
        }

        Text {
            id: text2
            x: 165
            y: 190
            text: "Frame Rate (FPS)"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text3
            x: 165
            y: 226
            text: "Stack Usage"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text4
            x: 165
            y: 262
            text: "Heap Usage"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text5
            x: 165
            y: 298
            text: "Render Time (Frame Latency)"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text6
            x: 165
            y: 334
            text: "CPU Load %"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text7
            x: 416
            y: 154
            color: "#ffffff"
            text: "Result"
            font.pixelSize: 18
            font.family: "Calibri"
            font.bold: true
        }

        Text {
            id: text8
            x: 416
            y: 190
            color: "#ffffff"
            text: QulPerf.averageFps
            font.pixelSize: 18
            font.family: "Calibri"
        }

        Text {
            id: text9
            x: 416
            y: 226
            color: "#ffffff"
            text: QulPerf.maxStackUsage
            font.pixelSize: 18
            font.family: "Calibri"
        }

        Text {
            id: text10
            x: 416
            y: 262
            color: "#ffffff"
            text: QulPerf.maxHeapUsage
            font.pixelSize: 18
            font.family: "Calibri"
        }

        Text {
            id: text11
            x: 416
            y: 298
            color: "#ffffff"
            text: QulPerf.repaint
            font.pixelSize: 18
            font.family: "Calibri"
        }

        Text {
            id: text12
            x: 416
            y: 334
            color: "#ffffff"
            text: QulPerf.averageCpuLoad
            font.pixelSize: 18
            font.family: "Calibri"
        }
    }
}
