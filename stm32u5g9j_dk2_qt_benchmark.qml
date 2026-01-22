import QtQuick

Rectangle {
    id: root
    width: 800
    height: 480

    property StatusProvider setStatus

    property int currentScreen: MainScreen.ScreenIndex.MainscreenButton
    property int demoName: 1
    property real tempfpsAvg: 0
    property real tempstackusageAvg: 0
    property real tempheapusageAvg: 0
    property real tempredertimeAvg: 0
    property real tempcpuloadAvg: 0
    property int fpsAvg: 0
    property int stackusageAvg: 0
    property int heapusageAvg: 0
    property int redertimeAvg: 0
    property int cpuloadAvg: 0
    property int tickTimeAvg: 0
    property bool openMenuOnReturn: false

    Text {
        id: demo
        x: 415
        y: 154
        z: 10
        font.family: "Calibri"
        font.pixelSize: 18
        color: "white"
        font.bold: true
        visible: currentScreen === MainScreen.ScreenIndex.ResultScreen
        text:switch (demoName) {
             case MainScreen.ScreenIndex.VideoTest:
                 "Video Test";
                 break;
             case MainScreen.ScreenIndex.Test2D:
                 "2D Test";
                 break;
             case MainScreen.ScreenIndex.StaticImage:
                 "Static Test";
                 break;
             case MainScreen.ScreenIndex.SVGDemo:
                 "SVG Test";
                 break;
             case MainScreen.ScreenIndex.TextScroll:
                 "Text Scroll Test";
                 break;
             case MainScreen.ScreenIndex.MotorCluster:
                 "Cluster Test";
                 break;
             default:
                 "";
             }
    }

    Text {
        id: framevalue
        x: 415
        y: 190
        z: 10
        text: fpsAvg
        font.family: "Calibri"
        font.pixelSize: 18
        color: "white"
        visible: currentScreen === MainScreen.ScreenIndex.ResultScreen
    }

    Text {
        id: stackvalue
        x: 415
        y: 226
        z: 10
        text: stackusageAvg + " KB"
        font.family: "Calibri"
        font.pixelSize: 18
        color: "white"
        visible: currentScreen === MainScreen.ScreenIndex.ResultScreen
    }

    Text {
        id: heapvalue
        x: 415
        y: 262
        z: 10
        text: heapusageAvg + " KB"
        font.family: "Calibri"
        font.pixelSize: 18
        color: "white"
        visible: currentScreen === MainScreen.ScreenIndex.ResultScreen
    }

    Text {
        id: rendervalue
        x: 415
        y: 298
        z: 10
        text: redertimeAvg + " ms"
        font.family: "Calibri"
        font.pixelSize: 18
        color: "white"
        visible: currentScreen === MainScreen.ScreenIndex.ResultScreen
    }

    Text {
        id: cpuvalue
        x: 415
        y: 334
        z: 10
        text: cpuloadAvg + " %"
        font.family: "Calibri"
        font.pixelSize: 18
        color: "white"
        visible: currentScreen === MainScreen.ScreenIndex.ResultScreen
    }

    Rectangle {
        id: matrices
        x: 690
        y: 450
        z: 10
        width: 110
        height: 30
        color: "black"
        opacity: 0.4
    }

    Text {
        x: 695
        y: 450
        z: 10
        text: setStatus.fps + " FPS, "
        color: "white"
        font.family: "Calibri"
        font.pixelSize: 15
    }

    Text {
        x: 740
        y: 450
        z: 10
        text: setStatus.cpuUsage + " %CPU"
        color: "white"
        font.family: "Calibri"
        font.pixelSize: 15
    }

    Text {
        x: 695
        y: 461
        z: 10
        text: setStatus.renderTime + " ms"
        color: "white"
        font.family: "Calibri"
        font.pixelSize: 15
    }

    Timer {
        id: statusTimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            setStatus.update(setStatus.cpuUsage, setStatus.stackUsage, setStatus.heapUsage, setStatus.fps, setStatus.renderTime);

            statusTimer.interval = 1000;

            if (currentScreen >= 1 && currentScreen <= 6) {
                tickTimeAvg++;
                tempfpsAvg        += setStatus.fps;
                tempstackusageAvg += setStatus.stackUsage;
                tempheapusageAvg  += setStatus.heapUsage;
                tempredertimeAvg  += setStatus.renderTime;
                tempcpuloadAvg    += setStatus.cpuUsage;
            } else {
                tickTimeAvg = 0;
            }
        }
    }

    Loader {
        id: screenLoader
        anchors.fill: parent
        z: 1
        sourceComponent: {
            switch (currentScreen) {
            case MainScreen.ScreenIndex.VideoTest:
                demoName = 1;
                return videoTest;
            case MainScreen.ScreenIndex.Test2D:
                demoName = 2;
                return test2D;
            case MainScreen.ScreenIndex.StaticImage:
                demoName = 3;
                return staticimage;
            case MainScreen.ScreenIndex.SVGDemo:
                demoName = 4;
                return svgDemo;
            case MainScreen.ScreenIndex.TextScroll:
                demoName = 5;
                return textScroll;
            case MainScreen.ScreenIndex.ResultScreen:
                return resultScreen;
            case MainScreen.ScreenIndex.MotorCluster:
                demoName = 6;
                return motorCluster;
            default:
                return mainScreen;
            }
        }
    }

    function goToResultScreen() {
        if (tickTimeAvg > 0) {
            fpsAvg        = Math.round(tempfpsAvg        / tickTimeAvg);
            stackusageAvg = Math.round(tempstackusageAvg / tickTimeAvg);
            heapusageAvg  = Math.round(tempheapusageAvg  / tickTimeAvg);
            redertimeAvg  = Math.round(tempredertimeAvg  / tickTimeAvg);
            cpuloadAvg    = Math.round(tempcpuloadAvg    / tickTimeAvg);
        }
        tickTimeAvg = 0;
        tempfpsAvg = 0;
        tempstackusageAvg = 0;
        tempheapusageAvg = 0;
        tempredertimeAvg = 0;
        tempcpuloadAvg = 0;

        openMenuOnReturn = true;

        currentScreen = MainScreen.ScreenIndex.ResultScreen;
    }

    function goToMainScreen() {
        currentScreen = MainScreen.ScreenIndex.MainscreenButton;
    }

    Component {
        id: mainScreen
        MainScreen {
            id: mainScreenInstance

            Component.onCompleted: {
                if (openMenuOnReturn) {
                    mainScreenInstance.forceOpen = true;
                    mainScreenInstance.isOpen = true;
                    mainScreenInstance.tickCounter = false;
                    openMenuOnReturn = false;
                }
            }

            onNavigateTo: {
                currentScreen = index;

                // Use a longer interval at first, to make sure metrics_print has the
                // time to finish at least one time with results fully from the next screen
                statusTimer.interval = 2000;
                statusTimer.restart();
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

    Rectangle {
        id: frameRedrawRectangle
        width: 1
        height: 1
        color: "#000000"
        opacity: 0.02
        property real t: 0
        NumberAnimation on t { from: 0; to: 1; running: true; loops: Animation.Infinite; }
        onTChanged: frameRedrawRectangle.visible = !frameRedrawRectangle.visible
    }
}
