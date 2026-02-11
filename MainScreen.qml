import QtQuick

Image {
    id: mainScreen
    source: "images/ui_bg.png"

    signal navigateTo(index: int)
    signal startAutoMode()

    enum ScreenIndex {
        MainscreenButton = 0,
        VideoTest,
        Test2D,
        StaticImage,
        SVGDemo,
        TextScroll,
        MotorCluster,
        ResultScreen
    }

    property bool isOpen: false
    property bool forceOpen : false
    property bool tickCounter : true

    function handleClick(index: int) {
        if (index === MainScreen.ScreenIndex.MainscreenButton) {
            isOpen = false;
            frameTimer.running = true;
        } else {
            navigateTo(index);
        }
    }

    Component {
        id: buttonComponent

        Image {
            id: button

            readonly property real radius: 170
            readonly property real angleStep: (360 / 7)
            readonly property real startAngle: 90

            readonly property real xOffset: Math.cos((startAngle + index * angleStep) * Math.PI / 180) * radius
            readonly property real yOffset: Math.sin((startAngle + index * angleStep) * Math.PI / 180) * radius

            source: "images/ui_button.png"

            opacity: isOpen ? 1 : 0

            x: 800 / 2 - width / 2 + (isOpen ? xOffset : 0)
            y: 480 / 2 - height / 2 + (isOpen ? yOffset : 0)

            MouseArea {
                anchors.fill: parent
                enabled: isOpen
                onClicked: {
                    if (forceOpen) {
                        forceOpen = false;
                    }

                    handleClick(index);
                }
            }

            Behavior on x {
                NumberAnimation {
                    duration: forceOpen ? 1 : 800
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                NumberAnimation {
                    duration: forceOpen ? 1 : 800
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                NumberAnimation {
                    duration: forceOpen ? 1 : 800
                    easing.type: Easing.Linear
                }
            }

            Text {
                id: buttonText
                anchors.centerIn: parent
                text: switch (index) {
                case MainScreen.ScreenIndex.VideoTest:
                    "Video\n  Test";
                    break;
                case MainScreen.ScreenIndex.Test2D:
                    "2D";
                    break;
                case MainScreen.ScreenIndex.StaticImage:
                    "Static";
                    break;
                case MainScreen.ScreenIndex.SVGDemo:
                    "SVG";
                    break;
                case MainScreen.ScreenIndex.TextScroll:
                    " Text\nScroll";
                    break;
                case MainScreen.ScreenIndex.MotorCluster:
                    "Cluster";
                    break;
                default:
                    "";
                }
                color: "white"
                font.family: "Calibri"
                font.pixelSize: 14
                font.bold: true
            }

            Image {
                id: cancel
                anchors.centerIn: parent
                source: "images/cancel.png"
                visible: index === MainScreen.ScreenIndex.MainscreenButton
            }
        }
    }

    Image {
        id: startButton
        anchors.centerIn: parent
        source: "images/ui_button_center.png"
        width: 190
        height: 188

        Text {
            anchors.centerIn: startButton
            text: "START"
            color: "white"
            font.family: "Calibri"
            font.pixelSize: 44
            visible: ((mainScreen.isOpen === false) && tickCounter)
            font.bold: true
        }

        MouseArea {
            anchors.fill: startButton
            onClicked: {
                var dx = mouse.x - width / 2
                var dy = mouse.y - height / 2
                var r  = width / 2

                if (dx*dx + dy*dy <= r*r) {
                    mainScreen.forceOpen = false
                    frameTimer.running = false
                    tickCounter = false
                    if (autoSwitch.checked) {
                        startAutoMode()
                    } else {
                        isOpen = true
                    }
                }
            }
        }
    }

    Image {
        id: autoSwitch
        x: 0
        y: 438
        source: autoSwitch.checked ? "images/toggle_right.png" : "images/toggle_left.png"
        property bool checked: false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                autoSwitch.checked = !autoSwitch.checked
                if (mainScreen.isOpen) {
                    mainScreen.forceOpen = true
                    mainScreen.handleClick(MainScreen.ScreenIndex.MainscreenButton)
                }
            }
        }

        Text {
            x: 88
            text: autoSwitch.checked ? "Auto" : "Manual"
            color: "white"
            font.family: "Calibri"
            font.pixelSize: 18
            anchors.verticalCenterOffset: 0
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Repeater {
        model: 7
        delegate: buttonComponent
    }

    Timer {
        id: frameTimer
        interval: mainScreen.forceOpen ? 0 : 800
        running: false
        onTriggered: {
            mainScreen.tickCounter = true;
        }
    }
}
