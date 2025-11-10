import QtQuick

Rectangle {
    id: root
    width: 150
    height: 50
    color: "lightblue"
    radius: 8

    property alias text: label.text
    signal clicked

    Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: 18
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
