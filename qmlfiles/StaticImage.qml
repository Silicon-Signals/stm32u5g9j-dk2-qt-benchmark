import QtQuick

Item {
    id: staticimage
    width: 800
    height: 480

    signal showResultScreen()

    property int colorIndex: 0
    property string squareColor: "#FF0000"
    property string circleColor: "#00FF00"
    property string rectangleColor: "#0000FF"

    Rectangle {
        width: 800
        height: 480
        color: "#FFFFFF"

        Rectangle {
            id: square
            x: 141
            y: 52
            width: 150; height: 150
            color: squareColor
        }

        Rectangle {
            id: alphaSquare
            x: 482
            y: 292
            opacity: 0.5
            width: 150; height: 150
            color: squareColor
        }

        Rectangle {
            id: rectange
            x: 466
            y: 77
            width: 200; height: 100
            color: rectangleColor
            radius: 20
        }

        Rectangle {
            id: circle
            x: 141
            y: 277
            width: 150; height: 150
            color: circleColor
            radius: 100
        }

        Rectangle {
            id: alphaCircle
            x: 557
            y: 217
            opacity: 0.5
            width: 150; height: 150
            color: circleColor
            radius: 100
        }
    }

    Timer {
        id: frameTimer
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            colorIndex = (colorIndex + 1) % 3

            switch(colorIndex) {
                case 0: squareColor="#FF0000"; circleColor="#00FF00"; rectangleColor="#0000FF"; break
                case 1: squareColor="#00FF00"; circleColor="#0000FF"; rectangleColor="#FF0000"; break
                case 2: squareColor="#0000FF"; circleColor="#FF0000"; rectangleColor="#00FF00"; break
            }
        }
    }

    Timer {
        id: stopTimer
        interval: 10000
        running: true
        onTriggered: {
            showResultScreen()
        }
    }
}
