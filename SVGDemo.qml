import QtQuick

Rectangle {
    id: svgDemo
    width: 800
    height: 480
    color: "#FFFFFF"

    signal showResultScreen

    property int tiredelay: 700
    property int pairhold: 300

    // Car Body
    Image {
        id: car_body
        x: 183
        y: 271
        source: "images/car_body.svg"
    }

    Image {
        id: tire_pair1
        x: 219
        y: 314
        source: "images/tire_pair1.svg"
        visible: true
    }

    Image {
        id: tire_pair2
        x: 219
        y: 314
        source: "images/tire_pair2.svg"
        visible: false
    }

    Image {
        id: tire_pair3
        x: 219
        y: 314
        source: "images/tire_pair3.svg"
        visible: false
    }

    Image {
        id: tire_pair4
        x: 219
        y: 314
        source: "images/tire_pair4.svg"
        visible: false
    }

    Image {
        id: tire_pair5
        x: 219
        y: 314
        source: "images/tire_pair5.svg"
        visible: false
    }

    // Ellipse
    Image {
        id: ellipse
        x: 87
        y: -38
        source: "images/Ellipse.svg"
    }

    Image {
        id: tire1
        x: 367
        y: 165
        source: "images/Tire1.svg"
    }

    Image {
        id: tire2
        x: 543
        y: 127
        source: "images/Tire2.svg"
    }

    Image {
        id: tire3
        x: 659
        y: 16
        source: "images/Tire3.svg"
    }

    Image {
        id: tire4
        x: 80
        y: 16
        source: "images/Tire4.svg"
    }

    Image {
        id: tire5
        x: 188
        y: 127
        source: "images/Tire5.svg"
    }

    SequentialAnimation {
        id: tireAnimation
        running: true
        loops: Animation.Infinite

        ParallelAnimation {
            PropertyAnimation {
                target: tire1
                property: "x"
                to: 367
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire1
                property: "y"
                to: 165
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "x"
                to: 543
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "x"
                to: 659
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "x"
                to: 80
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "x"
                to: 188
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire_pair1
                property: "visible"
                to: true
                duration: pairhold
            }
            PropertyAnimation {
                target: tire_pair5
                property: "visible"
                to: false
                duration: pairhold
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: tire1
                property: "x"
                to: 188
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire1
                property: "y"
                to: 129
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "x"
                to: 367
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "y"
                to: 165
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "x"
                to: 543
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "x"
                to: 659
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "x"
                to: 80
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire_pair1
                property: "visible"
                to: false
                duration: pairhold
            }
            PropertyAnimation {
                target: tire_pair2
                property: "visible"
                to: true
                duration: pairhold
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: tire1
                property: "x"
                to: 80
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire1
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "x"
                to: 188
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "x"
                to: 367
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "y"
                to: 165
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "x"
                to: 543
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "x"
                to: 659
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire_pair2
                property: "visible"
                to: false
                duration: pairhold
            }
            PropertyAnimation {
                target: tire_pair3
                property: "visible"
                to: true
                duration: pairhold
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: tire1
                property: "x"
                to: 659
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire1
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "x"
                to: 80
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "x"
                to: 188
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "x"
                to: 367
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "y"
                to: 165
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "x"
                to: 543
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire_pair3
                property: "visible"
                to: false
                duration: pairhold
            }
            PropertyAnimation {
                target: tire_pair4
                property: "visible"
                to: true
                duration: pairhold
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: tire1
                property: "x"
                to: 543
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire1
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "x"
                to: 659
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire2
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "x"
                to: 80
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire3
                property: "y"
                to: 16
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "x"
                to: 188
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire4
                property: "y"
                to: 127
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "x"
                to: 367
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire5
                property: "y"
                to: 165
                duration: tiredelay
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: tire_pair4
                property: "visible"
                to: false
                duration: pairhold
            }
            PropertyAnimation {
                target: tire_pair5
                property: "visible"
                to: true
                duration: pairhold
            }
        }
    }

    Timer {
        id: stopTimer
        interval: 10000
        running: true
        repeat: false
        onTriggered: {
            tireAnimation.running = false;
            showResultScreen();
        }
    }
}
