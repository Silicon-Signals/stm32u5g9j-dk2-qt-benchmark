import QtQuick
import "shapes"

Rectangle {
    id: svgDemo
    width: 800
    height: 480
    color: "#FFFFFF"

    signal showResultScreen

    property int tiredelay: 700
    property int pairhold: 300

    // Car Body
    CarBody {
        id: car_body
        x: 183
        y: 271
        // source: "images/car_body.svg"
    }

    Item {
        id: tire_pair1
        x: 219
        y: 314
        // source: "images/tire_pair1.svg"
        visible: true

        Tire1 {
            x: 8
            y: 8
        }
        Tire1 {
            x: 290
            y: 8
        }
    }

    Item {
        id: tire_pair2
        x: 219
        y: 314
        // source: "images/tire_pair2.svg"
        visible: false

        Tire2 {
            x: 8
            y: 8
        }
        Tire2 {
            x: 290
            y: 8
        }
    }

    Item {
        id: tire_pair3
        x: 219
        y: 314
        // source: "images/tire_pair3.svg"
        visible: false

        Tire3 {
            x: 8
            y: 8
        }
        Tire3 {
            x: 290
            y: 8
        }
    }

    Item {
        id: tire_pair4
        x: 219
        y: 314
        // source: "images/tire_pair4.svg"
        visible: false

        Tire4 {
            x: 8
            y: 8
        }
        Tire4 {
            x: 290
            y: 8
        }
    }

    Item {
        id: tire_pair5
        x: 219
        y: 314
        // source: "images/tire_pair5.svg"
        visible: false

        Tire5 {
            x: 8
            y: 8
        }
        Tire5 {
            x: 290
            y: 8
        }
    }

    // Ellipse
    Ellipse {
        id: ellipse
        x: 87
        y: -38
        // source: "images/ellipse.svg"
    }

    Tire1 {
        id: tire1
        x: 367
        y: 165
        // source: "images/tire1.svg"
    }

    Tire2 {
        id: tire2
        x: 543
        y: 127
        // source: "images/tire2.svg"
    }

    Tire3 {
        id: tire3
        x: 659
        y: 16
        // source: "images/tire3.svg"
    }

    Tire4 {
        id: tire4
        x: 80
        y: 16
        // source: "images/tire4.svg"
    }

    Tire5 {
        id: tire5
        x: 188
        y: 127
        // source: "images/tire5.svg"
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
