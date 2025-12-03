import QtQuick

Image {
    id: mainScreen
    source: "images/ui_bg.png"

    signal navigateTo(index: int)

    enum ScreenIndex {
        VideoTest = 0,
        Test2D,
        StaticImage,
        SVGDemo,
        TextScroll,
        Main,
        ResultScreen
    }

    property bool isOpen: false

    function handleClick(index: int) {
        if (index === MainScreen.ScreenIndex.Main) {
            isOpen = false;
        } else {
            navigateTo(index);
        }
    }

    Component {
        id: buttonComponent

        Image {
            id: button

            readonly property real radius: 150     // Distance from center when open
            readonly property real angleStep: 60   // 360° / 6 buttons = 60°
            readonly property real startAngle: 150 // Start exactly BELOW center button

            readonly property real xOffset: Math.cos((startAngle + index * angleStep) * Math.PI / 180) * radius
            readonly property real yOffset: Math.sin((startAngle + index * angleStep) * Math.PI / 180) * radius

            source: "images/ui_button.png"

            opacity: isOpen ? 1 : 0

            x: 800 / 2 - width / 2 + (isOpen ? xOffset : 0)
            y: 480 / 2 - height / 2 + (isOpen ? yOffset : 0)

            MouseArea {
                anchors.fill: parent
                enabled: isOpen
                onClicked: handleClick(index)
            }

            Behavior on x {
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Text {
                id: buttonText
                anchors.centerIn: parent
                text: switch (index) {
                case MainScreen.ScreenIndex.VideoTest:
                    "Video\nTest";
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
                    "Text\nScroll";
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
                visible: index === MainScreen.ScreenIndex.Main
            }
        }
    }

    Image {
        id: startButton
        anchors.centerIn: parent
        // no need to specific size
        // width: 190
        // height: 188
        source: "images/ui_button_center.png"

        // no need to speicifc transformOrigin without using transform
        // transformOrigin: Item.Center

        Text {
            anchors.centerIn: parent
            text: "START"
            color: "white"
            font.family: "Calibri"
            font.pixelSize: 44
            visible: !mainScreen.isOpen
            font.bold: true
        }

        MouseArea {
            anchors.fill: startButton
            onClicked: mainScreen.isOpen = true
        }
    }

    Repeater {
        model: 6
        delegate: buttonComponent
    }
}
