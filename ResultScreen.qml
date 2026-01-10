import QtQuick

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
            width: 63
            height: 65
            source: "images/result_home_button.png"

            MouseArea {
                anchors.fill: parent
                onClicked: backToMain()
            }
        }

        Text {
            id: text1
            x: 165
            y: 106
            text: "Test"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
            font.bold: true
        }

        Text {
            id: text2
            x: 165
            y: 142
            text: "Frame Rate (FPS)"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text3
            x: 165
            y: 178
            text: "RAM Usage"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text4
            x: 165
            y: 214
            text: "Internal Flash Usage"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text5
            x: 165
            y: 250
            text: "External Flash Usage"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text6
            x: 165
            y: 286
            text: "Render Time (Frame Latency)"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: text7
            x: 165
            y: 322
            text: "CPU Load %"
            font.family: "Calibri"
            font.pixelSize: 18
            color: "white"
        }
    }
}
