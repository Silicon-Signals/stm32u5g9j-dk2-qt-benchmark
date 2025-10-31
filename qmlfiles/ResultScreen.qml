import QtQuick

Item {
    id: resultScreen
    width: 800
    height: 480

    signal backToMain()

    Image {
        id: resultBG
        source: "images/result_bg.png"
        fillMode: Image.PreserveAspectFit

        Image {
            id: homeButton
            x: 369
            y: 378
            width: 63
            height: 65
            source: "images/result_home_button.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                anchors.fill: parent
                onClicked:
                    backToMain()
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
    }
}
