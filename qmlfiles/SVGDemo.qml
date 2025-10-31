import QtQuick
import QtQuick.Controls

Item {
    id: svgDemo
    width: 800
    height: 480

    signal showResultScreen()

    property int tiredelay: 700
    property int pairhold: 300

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 800
        height: 480
        color: "#FFFFFF"

        // Car Body
        Image {
            id: carbody
            x: 183
            y: 271
            width: 433
            height: 115
            source: "images/Car Body.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: tirepair1
            x: 219
            y: 314
            width: 368
            height: 85
            source: "images/tire_pair1.svg"
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        Image {
            id: tirepair2
            x: 219
            y: 314
            width: 368
            height: 85
            source: "images/tire_pair2.svg"
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        Image {
            id: tirepair3
            x: 219
            y: 314
            width: 368
            height: 85
            source: "images/tire_pair3.svg"
            fillMode: Image.PreserveAspectFit
            visible: true
        }

        Image {
            id: tirepair4
            x: 219
            y: 314
            width: 368
            height: 85
            source: "images/tire_pair4.svg"
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        Image {
            id: tirepair5
            x: 219
            y: 314
            width: 368
            height: 85
            source: "images/tire_pair5.svg"
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        // Ellipse
        Image {
            id: ellipse
            x: 87
            y: -38
            width: 629
            height: 241
            source: "images/Ellipse.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: tire1
            x: 80
            y: 16
            width: 65
            height: 65
            source: "images/Tire1.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: tire2
            x: 188
            y: 127
            width: 65
            height: 65
            source: "images/Tire2.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: tire3
            x: 367
            y: 165
            width: 65
            height: 65
            source: "images/Tire3.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: tire4
            x: 546
            y: 127
            width: 65
            height: 65
            source: "images/Tire4.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: tire5
            x: 659
            y: 16
            width: 65
            height: 65
            source: "images/Tire5.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

    SequentialAnimation {
        id: tireAnimation
        running: true
        loops: Animation.Infinite

        ParallelAnimation {
            PropertyAnimation { target: tire1; property: "x"; to: 80; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire1; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "x"; to: 188; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "x"; to: 367; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "y"; to: 165; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "x"; to: 546; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "x"; to: 659; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tirepair3; property: "visible"; to: true; duration: pairhold }
            PropertyAnimation { target: tirepair4; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair5; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair1; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair2; property: "visible"; to: false; duration: pairhold }
        }

        ParallelAnimation {
            PropertyAnimation { target: tire1; property: "x"; to: 659; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire1; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "x"; to: 80; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "x"; to: 188; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "x"; to: 367; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "y"; to: 165; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "x"; to: 546; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tirepair3; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair4; property: "visible"; to: true; duration: pairhold }
            PropertyAnimation { target: tirepair5; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair1; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair2; property: "visible"; to: false; duration: pairhold }
        }

        ParallelAnimation {
            PropertyAnimation { target: tire1; property: "x"; to: 546; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire1; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "x"; to: 659; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "x"; to: 80; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "x"; to: 188; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "x"; to: 367; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "y"; to: 165; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tirepair3; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair4; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair5; property: "visible"; to: true; duration: pairhold }
            PropertyAnimation { target: tirepair1; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair2; property: "visible"; to: false; duration: pairhold }
        }

        ParallelAnimation {
            PropertyAnimation { target: tire1; property: "x"; to: 367; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire1; property: "y"; to: 165; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "x"; to: 546; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "x"; to: 659; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "x"; to: 80; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "x"; to: 188; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tirepair3; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair4; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair5; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair1; property: "visible"; to: true; duration: pairhold }
            PropertyAnimation { target: tirepair2; property: "visible"; to: false; duration: pairhold }
        }

        ParallelAnimation {
            PropertyAnimation { target: tire1; property: "x"; to: 188; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire1; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "x"; to: 367; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire2; property: "y"; to: 165; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "x"; to: 546; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire3; property: "y"; to: 127; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "x"; to: 659; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire4; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "x"; to: 80; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tire5; property: "y"; to: 16; duration: tiredelay; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: tirepair3; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair4; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair5; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair1; property: "visible"; to: false; duration: pairhold }
            PropertyAnimation { target: tirepair2; property: "visible"; to: true; duration: pairhold }
        }
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
