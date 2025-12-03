import QtQuick

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
                return videoTest;
            case MainScreen.ScreenIndex.Test2D:
                return test2D;
            case MainScreen.ScreenIndex.StaticImage:
                return staticimage;
            case MainScreen.ScreenIndex.SVGDemo:
                return svgDemo;
            case MainScreen.ScreenIndex.TextScroll:
                return textScroll;
            case MainScreen.ScreenIndex.ResultScreen:
                return resultScreen;
            default:
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
        id: resultScreen
        ResultScreen {
            id: resultScreenInstance
            onBackToMain: goToMainScreen()
        }
    }
}
