import QtQuick
import QtQuickUltralite.Extras

AnimatedSpriteDirectory {
    id: videotest
    sourcePath: "frames"
    frameDuration: 100

    signal showResultScreen

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
