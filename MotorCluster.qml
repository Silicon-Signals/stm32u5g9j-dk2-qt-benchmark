import QtQuick
import QtQuickUltralite.Extras

Image {
    id: cluster
    source: "images/cluster_bg.png"

    signal showResultScreen

    property bool lowfuelflag: false
    property bool fuelsymbolflag: false
    property bool batterysymbolflag: true
    property bool lowbatteryflag: false
    property bool engineflag: false
    property bool serviceflag: false
    property bool leftindicatorflag: true
    property bool rightindicatorflag: false
    property bool dipperflag: false

    property int tickCount: 0
    property int indicatorStage: 0
    property int stageTick: 0
    property int blinkStage: 0
    property int leftframeIndex: 0
    property int leftframeCount: 40
    property int phaseForward1: 0
    property int phaseReverse1: 1
    property int phaseForward2: 2
    property int phaseReverse2: 3
    property int phaseForward3: 4
    property int phase: phaseForward1
    property int rightframeIndex: 0
    property int rightframeCount: 40
    property int rpmcounter: 0
    property int speedcounter: 0
    property int gearcounter: 0
    property int currentKm: 0
    property int fuelState: 0
    property int batteryState: 0

    Image {
        id: leftIndicator
        x: 181
        y: 30
        source: "images/left_indicator.png"
        visible: !leftindicatorflag
    }

    Image {
        id: leftIndicatorlight
        x: 181
        y: 30
        source: "images/left_indicator_colored.png"
        visible: leftindicatorflag
    }

    Image {
        id: rightIndicator
        x: 569
        y: 30
        source: "images/right_indicator.png"
        visible: !rightindicatorflag
    }

    Image {
        id: rightIndicatorlight
        x: 569
        y: 30
        source: "images/right_indicator_colored.png"
        visible: rightindicatorflag
    }

    Image {
        id: dipper
        x: 273
        y: 30
        source: "images/dipper.png"
        visible: !dipperflag
    }

    Image {
        id: dipperlight
        x: 273
        y: 30
        source: "images/dipper_colored.png"
        visible: dipperflag
    }

    Image {
        id: engine
        x: 371
        y: 30
        source: "images/engine.png"
        visible: !engineflag
    }

    Image {
        id: enginelight
        x: 371
        y: 30
        source: "images/engine_colored.png"
        visible: engineflag
    }

    Image {
        id: service
        x: 478
        y: 30
        source: "images/service.png"
        visible: !serviceflag
    }

    Image {
        id: servicelight
        x: 478
        y: 30
        source: "images/service_colored.png"
        visible: serviceflag
    }

    Text {
        id: speedwrite
        x: 181
        y: 248
        text: "KM/H"
        font.pixelSize: 30
        font.family: "Digital-7 Italic"
        color: "white"
    }

    Text {
        id: speedvalue
        x: 188
        y: 194
        text: speedcounter
        font.pixelSize: 55
        font.family: "Digital-7 Italic"
        color: "white"
    }

    Text {
        id: gear
        x: 375
        y: 172
        text: "GEAR"
        font.pixelSize: 30
        font.family: "Digital-7 Italic"
        color: "white"
    }

    Text {
        id: gearvalue
        x: 388
        y: 116
        text: gearcounter
        font.pixelSize: 55
        font.family: "Digital-7 Italic"
        color: "white"
    }

    Text {
        id: rpm
        x: 564
        y: 248
        text: "% RPM"
        font.pixelSize: 30
        font.family: "Digital-7 Italic"
        color: "white"
    }

    Text {
        id: rpmvalue
        x: 575
        y: 194
        text: rpmcounter
        font.pixelSize: 55
        font.family: "Digital-7 Italic"
        color: "white"
    }

    Text {
        id: total
        x: 326
        y: 425
        text: "TOTAL:"
        font.pixelSize: 30
        font.family: "Digital-7 Italic"
        color: "white"
    }

    Text {
        id: totaltravel
        x: 411
        y: 425
        text: currentKm + " KM"
        font.pixelSize: 30
        font.family: "Digital-7 Italic"
        color: "white"
    }

    AnimatedSpriteDirectory {
        id: speedGuage
        sourcePath: "left_speedometer_mask_frames"
        x: -10
        y: 98
        currentFrame: leftframeIndex
        running: false
    }
    AnimatedSpriteDirectory {
        id: rpmframeGuage
        sourcePath: "right_speedometer_mask_frames"
        x: 511
        y: 98
        currentFrame: rightframeIndex
        running: false
    }

    Image {
        id: fullfuel
        x: 37
        y: 434
        source: "images/fuel_full.png"
        visible: fuelState == 0
    }

    Image {
        id: fuel80
        x: 37
        y: 434
        source: "images/fuel_80.png"
        visible: fuelState == 1
    }

    Image {
        id: fuel50
        x: 37
        y: 434
        source: "images/fuel_50.png"
        visible: fuelState == 2
    }

    Image {
        id: lowFuel
        x: 37
        y: 434
        source: "images/fuel_low.png"
        visible: fuelState == 3
    }

    Image {
        id: fuelSymbol
        x: 186
        y: 426
        source: "images/fuel_indicator.png"
        visible: !fuelsymbolflag
    }

    Image {
        id: fuelSymbolcolour
        x: 186
        y: 426
        source: "images/fuel_indicator_colored.png"
        visible: fuelsymbolflag
    }

    Image {
        id: batteryfull
        x: 614
        y: 272
        source: "images/battery_full.png"
        visible: batteryState == 0
    }

    Image {
        id: batteryhalf
        x: 614
        y: 272
        source: "images/battery_half.png"
        visible: batteryState == 1
    }

    Image {
        id: batterylow
        x: 614
        y: 272
        source: "images/battery_low.png"
        visible: batteryState == 2
    }

    Image {
        id: batterySymbol
        x: 740
        y: 349
        source: "images/battery.png"
        visible: !batterysymbolflag
    }

    Image {
        id: batterySymbolcolour
        x: 740
        y: 349
        source: "images/battery_colored.png"
        visible: batterysymbolflag
    }

    Timer {
        id: masterTimer
        interval: 500
        repeat: true
        running: true

        onTriggered: {
            tickCount++;

            //  INDICATOR SEQUENCE (EVERY 2 SEC)
            stageTick++;

            if (stageTick >= 4) {
                stageTick = 0;
                indicatorStage = (indicatorStage + 1) % 3;
            }

            if (indicatorStage == 0) {
                leftindicatorflag = false;
                rightindicatorflag = true;
            } else if (indicatorStage == 1) {
                leftindicatorflag = true;
                rightindicatorflag = true;
            } else if (indicatorStage == 2) {
                leftindicatorflag = true;
                rightindicatorflag = false;
            }

            // DIPPER BLINKING AT 8s & 15s
            if (tickCount == 16 || tickCount == 30) {
                blinkStage = 1;
            }

            if (blinkStage > 0) {
                dipperflag = ((dipperflag === false) ? true : false);
                blinkStage++;

                if (blinkStage > 4) {
                    blinkStage = 0;
                    dipperflag = false;
                }
            }

            // SERVICE ON and Change BATTERY to FUEL AT 10s
            if (tickCount == 20) {
                serviceflag = true;
                batterysymbolflag = false;
                fuelsymbolflag = true;
                lowbatteryflag = false;
            }

            // ENGINE ON AT 15s
            if (tickCount == 30) {
                engineflag = true;
            }

            // STATE MACHINE for BATTERY STATUS
            if (tickCount == 10) {
                batteryState = 1;
            }
            if (tickCount == 18) {
                batteryState = 2;
                lowbatteryflag = true;
            }

            // STATE MACHINE for FUEL STATUS
            if (tickCount == 26) {
                fuelState = 1;
            }
            if (tickCount == 32) {
                fuelState = 2;
            }
            if (tickCount == 38) {
                fuelState = 3;
                lowfuelflag = true;
            }
            if (tickCount == 40) {
                lowfuelflag = false;
            }
        }
    }

    Timer {
        id: frameTimer
        interval: 100
        running: true
        repeat: true

        onTriggered: {
            if (currentKm < 200) {
                currentKm++;
            }

            // Speed and Frame Mapping
            switch (phase) {
            case phaseForward1:
                leftframeIndex++;
                if (leftframeIndex >= leftframeCount - 1)
                    phase = phaseReverse1;
                break;
            case phaseReverse1:
                leftframeIndex--;
                if (leftframeIndex <= 13)
                    phase = phaseForward2;
                break;
            case phaseForward2:
                leftframeIndex++;
                if (leftframeIndex >= 30)
                    phase = phaseReverse2;
                break;
            case phaseReverse2:
                leftframeIndex--;
                if (leftframeIndex <= 3)
                    phase = phaseForward3;
                break;
            case phaseForward3:
                leftframeIndex++;
                if (leftframeIndex >= 21)
                    phase = phaseForward1;
                break;
            }

            // Gear and Speed Mapping
            if (leftframeIndex >= 1 && leftframeIndex <= 4) {
                gearcounter = 1;
                speedcounter = 3 + ((leftframeIndex - 1) * 7 / 3);
            } else if (leftframeIndex >= 4 && leftframeIndex <= 10) {
                gearcounter = 2;
                speedcounter = 10 + ((leftframeIndex - 4) * 20 / 6);
            } else if (leftframeIndex >= 10 && leftframeIndex <= 20) {
                gearcounter = 3;
                speedcounter = 30 + ((leftframeIndex - 10) * 20 / 10);
            } else if (leftframeIndex >= 20 && leftframeIndex <= 30) {
                gearcounter = 4;
                speedcounter = 50 + ((leftframeIndex - 20) * 30 / 10);
            } else if (leftframeIndex >= 30 && leftframeIndex <= 39) {
                gearcounter = 5;
                speedcounter = 80 + ((leftframeIndex - 30) * 40 / 9);
            } else {
                gearcounter = 0;
                speedcounter = 0;
            }

            // RPM Percentage (0–100%)
            rpmcounter = Math.floor((speedcounter * 100) / 120);

            if (rpmcounter < 0)
                rpmcounter = 0;
            if (rpmcounter > 100)
                rpmcounter = 100;

            rightframeIndex = (rpmcounter * 39) / 100;
        }
    }

    Rectangle {
        id: lowbattery
        anchors.horizontalCenter: parent.horizontalCenter
        y: 19
        width: 200
        height: 50
        color: "white"
        visible: lowbatteryflag

        Rectangle {
            anchors.centerIn: parent
            width: parent.width - 10
            height: parent.height - 10
            color: "#ff0000"
        }

        Image {
            x: 8
            y: 10
            source: "images/battery_notifictation.png"
        }

        Text {
            x: 44
            y: 15
            text: "Low Battery!!"
            font.family: "Calibri"
            font.pixelSize: 25
            color: "white"
            font.bold: true
        }
    }

    Rectangle {
        id: lowfuel
        anchors.horizontalCenter: parent.horizontalCenter
        y: 19
        width: 200
        height: 70
        color: "white"
        visible: lowfuelflag

        Rectangle {
            anchors.centerIn: parent
            width: parent.width - 10
            height: parent.height - 10
            color: "#ff0000"
        }

        Image {
            x: 8
            y: 20
            source: "images/fuel_indicator.png"
        }

        Text {
            x: 51
            y: 10
            text: "Low Fuel\nPlease refuel"
            font.family: "Calibri"
            font.pixelSize: 25
            color: "white"
            font.bold: true
        }
    }

    Timer {
        id: stopTimer
        interval: 20000
        running: true
        repeat: false
        onTriggered: {
            masterTimer.running = false;
            frameTimer.running = false;
            showResultScreen();
        }
    }
}
