import QtQuick
import QtQuick.Controls

Item {
    id: test2d
    width: 800
    height: 480

    signal showResultScreen()

    property int delay: 1000

    Image { id: preload; source: "images/siliconsignals.png"; visible: false}

    Rectangle {
        anchors.fill: parent
        color: "#12294B"

        Repeater {
            model: [ {x:65,  y:57},
                     {x:338, y:57},
                     {x:601, y:57} ]

            Image {
                width: 125; height: 125
                source: preload.source
                fillMode: Image.PreserveAspectFit
                x: modelData.x; y: modelData.y

                NumberAnimation on rotation {
                    from: 0; to: 360
                    duration: 5000
                    loops: Animation.Infinite
                    running: true
                }
            }
        }

        Repeater {
            model: [ {baseX:65,  baseY:298},
                     {baseX:338, baseY:298},
                     {baseX:601, baseY:298} ]

            Image {
                id: mover
                width: 125; height: 125
                source: preload.source
                fillMode: Image.PreserveAspectFit

                x: modelData.baseX
                y: modelData.baseY

                SequentialAnimation {
                    loops: Animation.Infinite
                    running: true

                    // 0 – up
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "y"; to: modelData.baseY-50; duration: delay }
                        NumberAnimation { target: mover; property: "x"; to: modelData.baseX;     duration: delay }
                    }

                    // 1 – centre
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "x"; to: modelData.baseX;     duration: delay }
                        NumberAnimation { target: mover; property: "y"; to: modelData.baseY;     duration: delay }
                    }

                    // 2 - down
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "y"; to: modelData.baseY+50; duration: delay }
                    }

                    // 3 – centre
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "x"; to: modelData.baseX;     duration: delay }
                        NumberAnimation { target: mover; property: "y"; to: modelData.baseY;     duration: delay }
                    }

                    // 4 – right
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "x"; to: modelData.baseX+50; duration: delay }
                    }

                    // 5 – centre
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "x"; to: modelData.baseX;     duration: delay }
                        NumberAnimation { target: mover; property: "y"; to: modelData.baseY;     duration: delay }
                    }

                    // 6 – centre
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "x"; to: modelData.baseX-50; duration: delay }
                    }

                    // 7 – centre
                    ParallelAnimation {
                        NumberAnimation { target: mover; property: "x"; to: modelData.baseX;     duration: delay }
                        NumberAnimation { target: mover; property: "y"; to: modelData.baseY;     duration: delay }
                    }
                }
            }
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
