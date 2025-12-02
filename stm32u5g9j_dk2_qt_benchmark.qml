import QtQuick

Rectangle {
    width: 800
    height: 480

    property StatusProvider setStatus

    property int currentScreen: 0
    property int demoName: 1
    property int tempfpsAvg: 0
    property int tempstackusageAvg: 0
    property int tempheapusageAvg: 0
    property int tempredertimeAvg: 0
    property int tempcpuloadAvg: 0
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
        visible: currentScreen == 7
        text: {
            if (demoName == 1)       "Video Test";
            else if (demoName == 2)  "2D Test";
            else if (demoName == 3)  "Static Test";
            else if (demoName == 4)  "SVG Test";
            else if (demoName == 5)  "Text Scroll Test";
            else if (demoName == 6)  "Cluster Test";
            else                     "";
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
        visible: currentScreen == 7
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
        visible: currentScreen == 7
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
        visible: currentScreen == 7
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
        visible: currentScreen == 7
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
        visible: currentScreen == 7
    }

    Rectangle {
        id: matrices
        x: 690
        y: 450
        z: 10
        width: 110; height: 30
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
            if (currentScreen == 0) {
                mainScreen;
            } else if (currentScreen == 1) {
                videoTest;
            } else if (currentScreen == 2) {
                test2D;
            } else if (currentScreen == 3) {
                staticimage;
            } else if (currentScreen == 4) {
                svgDemo;
            } else if (currentScreen == 5) {
                textScroll;
            } else if (currentScreen == 6) {
                motorCluster;
            } else if (currentScreen == 7) {
                resultScreen;
            }
        }
    }

    function goToResultScreen() {
        if (tickTimeAvg > 0) {
            fpsAvg        = tempfpsAvg        / tickTimeAvg;
            stackusageAvg = tempstackusageAvg / tickTimeAvg;
            heapusageAvg  = tempheapusageAvg  / tickTimeAvg;
            redertimeAvg  = tempredertimeAvg  / tickTimeAvg;
            cpuloadAvg    = tempcpuloadAvg    / tickTimeAvg;
        }
        tickTimeAvg = 0;
        tempfpsAvg = 0;
        tempstackusageAvg = 0;
        tempheapusageAvg = 0;
        tempredertimeAvg = 0;
        tempcpuloadAvg = 0;

        currentScreen = 7;
    }

    function goToMotorCluster() {
        demoName = 6;
        currentScreen = 6;
    }

    function goToTextScroll() {
        demoName = 5;
        currentScreen = 5;
    }

    function goToSVGDemo() {
        demoName = 4;
        currentScreen = 4;
    }

    function goToStaticImage() {
        demoName = 3;
        currentScreen = 3;
    }

    function goToTest2D() {
        demoName = 2;
        currentScreen = 2;
    }

    function goToVideoTest() {
        demoName = 1;
        currentScreen = 1;
    }

    function goToMainScreen() {
        openMenuOnReturn = true;
        currentScreen = 0;
    }

    Component {
        id: mainScreen
        MainScreen {
            id: mainScreenInstance

            Component.onCompleted: {
                if (openMenuOnReturn) {
                    mainScreenInstance.skipAnimationOnce = true;
                    mainScreenInstance.isOpen = true;
                    openMenuOnReturn = false;
                }
            }

            onNavigateToVideoTest: goToVideoTest()
            onNavigateToTest2D: goToTest2D()
            onNavigateToStaticImage: goToStaticImage()
            onNavigateToSVGDemo: goToSVGDemo()
            onNavigateToTextScroll: goToTextScroll()
            onNavigateToMotorCluster: goToMotorCluster()
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
}
