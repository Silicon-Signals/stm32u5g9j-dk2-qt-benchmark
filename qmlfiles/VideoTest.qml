import QtQuick
import QtQuickUltralite.Extras

// see: https://doc.qt.io/QtForMCUs/qml-qtquickultralite-extras-animatedspritedirectory.html
AnimatedSpriteDirectory {
    id: videotest
    sourcePath: "frames"
    frameDuration: 100

    signal showResultScreen

    // if want to jump back, you also can use finished() signal
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
