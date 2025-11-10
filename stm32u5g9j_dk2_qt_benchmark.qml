import QtQuick

Rectangle {
    width: 800
    height: 480

    property int currentScreen: 0

    Loader {
        id: screenLoader
        anchors.fill: parent
        sourceComponent: {
            if (currentScreen === 0) {
                mainScreen;
            } else if (currentScreen === 1) {
                videoTest;
            } else if (currentScreen === 2) {
                test2D;
            } else if (currentScreen === 3) {
                staticimage;
            } else if (currentScreen === 4) {
                svgDemo;
            } else if (currentScreen === 5) {
                textScroll;
            } else if (currentScreen === 6) {
                resultScreen;
            }
        }
    }

    function goToResultScreen() {
        currentScreen = 6;
    }

    function goToTextScroll() {
        currentScreen = 5;
    }

    function goToSVGDemo() {
        currentScreen = 4;
    }

    function goToStaticImage() {
        currentScreen = 3;
    }

    function goToTest2D() {
        currentScreen = 2;
    }

    function goToVideoTest() {
        currentScreen = 1;
    }

    function goToMainScreen() {
        currentScreen = 0;
    }

    Component {
        id: mainScreen
        MainScreen {
            id: mainScreenInstance
            onNavigateToVideoTest: goToVideoTest()
            onNavigateToTest2D: goToTest2D()
            onNavigateToStaticImage: goToStaticImage()
            onNavigateToSVGDemo: goToSVGDemo()
            onNavigateToTextScroll: goToTextScroll()
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
