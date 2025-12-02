import QtQuick

Item {
    id: mainScreen
    width: 800
    height: 480
    x: 0
    y: 0

    signal navigateToVideoTest
    signal navigateToTest2D
    signal navigateToStaticImage
    signal navigateToSVGDemo
    signal navigateToTextScroll
    signal navigateToMotorCluster

    property bool isOpen: false
    property bool skipAnimationOnce : false

    property real radius: 170
    property real angleStep: (360 / 7)

    property real startAngle: 90

    property real xOffset0: Math.cos((startAngle + 0 * angleStep) * Math.PI / 180) * radius
    property real yOffset0: Math.sin((startAngle + 0 * angleStep) * Math.PI / 180) * radius

    property real xOffset1: Math.cos((startAngle + 1 * angleStep) * Math.PI / 180) * radius
    property real yOffset1: Math.sin((startAngle + 1 * angleStep) * Math.PI / 180) * radius

    property real xOffset2: Math.cos((startAngle + 2 * angleStep) * Math.PI / 180) * radius
    property real yOffset2: Math.sin((startAngle + 2 * angleStep) * Math.PI / 180) * radius

    property real xOffset3: Math.cos((startAngle + 3 * angleStep) * Math.PI / 180) * radius
    property real yOffset3: Math.sin((startAngle + 3 * angleStep) * Math.PI / 180) * radius

    property real xOffset4: Math.cos((startAngle + 4 * angleStep) * Math.PI / 180) * radius
    property real yOffset4: Math.sin((startAngle + 4 * angleStep) * Math.PI / 180) * radius

    property real xOffset5: Math.cos((startAngle + 5 * angleStep) * Math.PI / 180) * radius
    property real yOffset5: Math.sin((startAngle + 5 * angleStep) * Math.PI / 180) * radius

    property real xOffset6: Math.cos((startAngle + 6 * angleStep) * Math.PI / 180) * radius
    property real yOffset6: Math.sin((startAngle + 6 * angleStep) * Math.PI / 180) * radius

    Image {
        id: backGround
        width: 800
        height: 480
        x: 0
        y: 0
        source: "images/ui_bg.png"
        fillMode: Image.PreserveAspectFit

        Image {
            id: startButton
            anchors.centerIn: parent
            width: 190
            height: 188
            source: "images/ui_button_center.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center

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

        Image {
            id: videotest
            width: 60
            height: 60
            source: "images/ui_button.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            opacity: mainScreen.isOpen ? 1 : 0

            x: mainScreen.width / 2 - width / 2 + (mainScreen.isOpen ? mainScreen.xOffset1 : 0)
            y: mainScreen.height / 2 - height / 2 + (mainScreen.isOpen ? mainScreen.yOffset1 : 0)

            MouseArea {
                anchors.fill: parent
                enabled: mainScreen.isOpen
                onClicked: navigateToVideoTest()
            }

            onXChanged: {
                if (mainScreen.skipAnimationOnce) {
                    mainScreen.skipAnimationOnce = false
                }
            }

            Behavior on x {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Video\n  Test"
                color: "white"
                font.family: "Calibri"
                font.pixelSize: 14
                font.bold: true
            }
        }

        Image {
            id: test2D
            width: 60
            height: 60
            source: "images/ui_button.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            opacity: mainScreen.isOpen ? 1 : 0

            x: mainScreen.width / 2 - width / 2 + (mainScreen.isOpen ? mainScreen.xOffset2 : 0)
            y: mainScreen.height / 2 - height / 2 + (mainScreen.isOpen ? mainScreen.yOffset2 : 0)

            MouseArea {
                anchors.fill: parent
                enabled: mainScreen.isOpen
                onClicked: navigateToTest2D()
            }

            onXChanged: {
                if (mainScreen.skipAnimationOnce) {
                    mainScreen.skipAnimationOnce = false
                }
            }

            Behavior on x {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Text {
                anchors.centerIn: parent
                text: "2D"
                color: "white"
                font.family: "Calibri"
                font.pixelSize: 14
                font.bold: true
            }
        }

        Image {
            id: staticimage
            width: 60
            height: 60
            source: "images/ui_button.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            opacity: mainScreen.isOpen ? 1 : 0

            x: mainScreen.width / 2 - width / 2 + (mainScreen.isOpen ? mainScreen.xOffset3 : 0)
            y: mainScreen.height / 2 - height / 2 + (mainScreen.isOpen ? mainScreen.yOffset3 : 0)

            MouseArea {
                anchors.fill: parent
                enabled: mainScreen.isOpen
                onClicked: navigateToStaticImage()
            }

            onXChanged: {
                if (mainScreen.skipAnimationOnce) {
                    mainScreen.skipAnimationOnce = false
                }
            }

            Behavior on x {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Static"
                color: "white"
                font.family: "Calibri"
                font.pixelSize: 14
                font.bold: true
            }
        }

        Image {
            id: svgDemo
            width: 60
            height: 60
            source: "images/ui_button.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            opacity: mainScreen.isOpen ? 1 : 0

            x: mainScreen.width / 2 - width / 2 + (mainScreen.isOpen ? mainScreen.xOffset4 : 0)
            y: mainScreen.height / 2 - height / 2 + (mainScreen.isOpen ? mainScreen.yOffset4 : 0)

            MouseArea {
                anchors.fill: parent
                enabled: mainScreen.isOpen
                onClicked: navigateToSVGDemo()
            }

            onXChanged: {
                if (mainScreen.skipAnimationOnce) {
                    mainScreen.skipAnimationOnce = false
                }
            }

            Behavior on x {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Text {
                anchors.centerIn: parent
                text: "SVG"
                color: "white"
                font.family: "Calibri"
                font.pixelSize: 14
                font.bold: true
            }
        }

        Image {
            id: textScroll
            width: 60
            height: 60
            source: "images/ui_button.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            opacity: mainScreen.isOpen ? 1 : 0

            x: mainScreen.width / 2 - width / 2 + (mainScreen.isOpen ? mainScreen.xOffset5 : 0)
            y: mainScreen.height / 2 - height / 2 + (mainScreen.isOpen ? mainScreen.yOffset5 : 0)

            MouseArea {
                anchors.fill: parent
                enabled: mainScreen.isOpen
                onClicked: navigateToTextScroll()
            }

            onXChanged: {
                if (mainScreen.skipAnimationOnce) {
                    mainScreen.skipAnimationOnce = false
                }
            }

            Behavior on x {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Text {
                anchors.centerIn: parent
                text: " Text\nScroll"
                color: "white"
                font.family: "Calibri"
                font.pixelSize: 14
                font.bold: true
            }
        }

        Image {
            id: motorCluster
            width: 60
            height: 60
            source: "images/ui_button.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            opacity: mainScreen.isOpen ? 1 : 0

            x: mainScreen.width / 2 - width / 2 + (mainScreen.isOpen ? mainScreen.xOffset6 : 0)
            y: mainScreen.height / 2 - height / 2 + (mainScreen.isOpen ? mainScreen.yOffset6 : 0)

            MouseArea {
                anchors.fill: parent
                enabled: mainScreen.isOpen
                onClicked: navigateToMotorCluster()
            }

            onXChanged: {
                if (mainScreen.skipAnimationOnce) {
                    mainScreen.skipAnimationOnce = false
                }
            }

            Behavior on x {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Cluster"
                color: "white"
                font.family: "Calibri"
                font.pixelSize: 14
                font.bold: true
            }
        }

        Image {
            id: closebutton
            width: 60
            height: 60
            source: "images/ui_button.png"
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            opacity: mainScreen.isOpen ? 1 : 0

            x: mainScreen.width / 2 - width / 2 + (mainScreen.isOpen ? mainScreen.xOffset0 : 0)
            y: mainScreen.height / 2 - height / 2 + (mainScreen.isOpen ? mainScreen.yOffset0 : 0)

            MouseArea {
                anchors.fill: parent
                enabled: mainScreen.isOpen
                onClicked: mainScreen.isOpen = false
            }

            onXChanged: {
                if (mainScreen.skipAnimationOnce) {
                    mainScreen.skipAnimationOnce = false
                }
            }

            Behavior on x {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on y {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on opacity {
                enabled: !mainScreen.skipAnimationOnce
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }

            Image {
                id: cancel
                width: 45
                height: 45
                visible: true
                anchors.centerIn: parent
                source: "images/cancel.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
