import QtQuick

Item {
    id: staticimage
    width: 800
    height: 480

    signal showResultScreen

    property int color_index: 0
    property int tickCounter: 0
    property string square_color: "#FF0000"
    property string circle_color: "#00FF00"
    property string rectangle_color: "#0000FF"

    Rectangle {
        width: 800
        height: 480
        color: "#FFFFFF"

        Rectangle {
            id: square
            x: 141
            y: 52
            width: 150
            height: 150
            color: square_color
        }

        Rectangle {
            id: alpha_square
            x: 482
            y: 292
            opacity: 0.5
            width: 150
            height: 150
            color: square_color
        }

        Rectangle {
            id: rectange
            x: 466
            y: 77
            width: 200
            height: 100
            color: rectangle_color
            radius: 20
        }

        Rectangle {
            id: circle
            x: 141
            y: 277
            width: 150
            height: 150
            color: circle_color
            radius: 100
        }

        Rectangle {
            id: alpha_circle
            x: 557
            y: 217
            opacity: 0.5
            width: 150
            height: 150
            color: circle_color
            radius: 100
        }
    }

    Timer {
        id: frameTimer
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            tickCounter++;
            color_index = (color_index + 1) % 3

            switch (color_index) {
            case 0:
                square_color = "#FF0000";
                circle_color = "#00FF00";
                rectangle_color = "#0000FF";
                break;
            case 1:
                square_color = "#00FF00";
                circle_color = "#0000FF";
                rectangle_color = "#FF0000";
                break;
            case 2:
                square_color = "#0000FF";
                circle_color = "#FF0000";
                rectangle_color = "#00FF00";
                break;
            }

            if (tickCounter == 50) {
                frameTimer.running = false;
                showResultScreen();
            }
        }
    }
}
