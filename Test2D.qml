import QtQuick

Rectangle {
    id: test2d
    width: 800
    height: 480
    color: "#12294B"

    signal showResultScreen

    property int delay: 1000

    Repeater {
        model: [
            {
                x: 65,
                y: 57
            },
            {
                x: 338,
                y: 57
            },
            {
                x: 601,
                y: 57
            }
        ]

        Image {
            source: "images/siliconsignals_logo.png"

            x: modelData.x
            y: modelData.y

            NumberAnimation on rotation {
                from: 0
                to: 360
                duration: 5000
                loops: Animation.Infinite
                running: true
            }
        }
    }

    Repeater {
        model: [
            {
                baseX: 65,
                baseY: 298
            },
            {
                baseX: 338,
                baseY: 298
            },
            {
                baseX: 601,
                baseY: 298
            }
        ]

        Image {
            id: mover
            source: "images/siliconsignals_logo.png"

            x: modelData.baseX
            y: modelData.baseY

            SequentialAnimation {
                loops: Animation.Infinite
                running: true

                // Up
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "y"
                        to: modelData.baseY - 50
                        duration: delay
                    }
                }

                // Centre
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "x"
                        to: modelData.baseX
                        duration: delay
                    }
                    NumberAnimation {
                        target: mover
                        property: "y"
                        to: modelData.baseY
                        duration: delay
                    }
                }

                // Down
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "y"
                        to: modelData.baseY + 50
                        duration: delay
                    }
                }

                // Centre
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "x"
                        to: modelData.baseX
                        duration: delay
                    }
                    NumberAnimation {
                        target: mover
                        property: "y"
                        to: modelData.baseY
                        duration: delay
                    }
                }

                // Left
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "x"
                        to: modelData.baseX - 50
                        duration: delay
                    }
                }

                // Centre
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "x"
                        to: modelData.baseX
                        duration: delay
                    }
                    NumberAnimation {
                        target: mover
                        property: "y"
                        to: modelData.baseY
                        duration: delay
                    }
                }

                // Right
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "x"
                        to: modelData.baseX + 50
                        duration: delay
                    }
                }

                // Centre
                ParallelAnimation {
                    NumberAnimation {
                        target: mover
                        property: "x"
                        to: modelData.baseX
                        duration: delay
                    }
                    NumberAnimation {
                        target: mover
                        property: "y"
                        to: modelData.baseY
                        duration: delay
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
            showResultScreen();
        }
    }
}
