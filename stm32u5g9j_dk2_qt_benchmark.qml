import QtQuick
import QtQuickUltralite.Extras

Rectangle {
    id: root
    width: 800
    height: 480

    property int currentScreen: MainScreen.ScreenIndex.Main

    Loader {
        id: screenLoader
        anchors.fill: parent
        sourceComponent: {
            switch (currentScreen) {
            case MainScreen.ScreenIndex.VideoTest:
                QulPerf.recording = true;
                return videoTest;
            case MainScreen.ScreenIndex.Test2D:
                QulPerf.recording = true;
                return test2D;
            case MainScreen.ScreenIndex.StaticImage:
                QulPerf.recording = true;
                return staticimage;
            case MainScreen.ScreenIndex.SVGDemo:
                QulPerf.recording = true;
                return svgDemo;
            case MainScreen.ScreenIndex.TextScroll:
                QulPerf.recording = true;
                return textScroll;
            case MainScreen.ScreenIndex.Cluster:
                QulPerf.recording = true;
                return motorCluster;
            case MainScreen.ScreenIndex.ResultScreen:
                QulPerf.recording = false;
                return resultScreen;
            default:
                QulPerf.recording = false;
                return mainScreen;
            }
        }
    }

    function goToResultScreen() {
        currentScreen = MainScreen.ScreenIndex.ResultScreen;
    }

    function goToMainScreen() {
        currentScreen = MainScreen.ScreenIndex.Main;
    }

    Component {
        id: mainScreen
        MainScreen {
            id: mainScreenInstance
            onNavigateTo: {
                currentScreen = index;
            }
        }
    }

    Component {
        id: videoTest
        VideoTest {
            id: videotestInstance
            onShowResultScreen: goToResultScreen()
        }
    }

    Component {
        id: test2D
        Test2D {
            id: test2DInstance
            onShowResultScreen: goToResultScreen()
        }
    }

    Component {
        id: staticimage
        StaticImage {
            id: staticimageInstance
            onShowResultScreen: goToResultScreen()
        }
    }

    Component {
        id: svgDemo
        SVGDemo {
            id: svgDemoInstance
            onShowResultScreen: goToResultScreen()
        }
    }

    Component {
        id: textScroll
        TextScroll {
            id: textscrollInstance
            onShowResultScreen: goToResultScreen()
        }
    }

    Component {
        id: motorCluster
        MotorCluster {
            id: motorclusterInstance
            onShowResultScreen: goToResultScreen()
        }
    }

    Component {
        id: resultScreen
        ResultScreen {
            id: resultScreenInstance
            onBackToMain: goToMainScreen()
        }
    }

    // Component.onCompleted: console.log(QulPerf.enabled ? "QUL_ENABLE_PERFORMANCE_LOGGING is ON" : "QUL_ENABLE_PERFORMANCE_LOGGING is OFF")
}
