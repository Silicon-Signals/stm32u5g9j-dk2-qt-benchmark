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

    property int tickCounter: 0
    property int indicatorStage: 0
    property int stageTick: 0
    property int blinkStage: 0
    property int animation_frame: 0
    property int leftframeCount: 40
    property int phaseForward1: 0
    property int phaseReverse1: 1
    property int phaseForward2: 2
    property int phaseReverse2: 3
    property int phaseForward3: 4
    property int phase: phaseForward1
    property int rpm_frame: 0
    property int rpm_percent: 0
    property int kmh_value: 0
    property int gear_value: 0
    property int totalKM: 0
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
        text: kmh_value
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
        text: gear_value
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
        text: rpm_percent
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
        text: totalKM + " KM"
        font.pixelSize: 30
        font.family: "Digital-7 Italic"
        color: "white"
    }

    AnimatedSpriteDirectory {
        id: speedGuage
        sourcePath: "left_speedometer_mask_frames"
        x: -10
        y: 98
        currentFrame: animation_frame
        running: false
    }
    AnimatedSpriteDirectory {
        id: rpmframeGuage
        sourcePath: "right_speedometer_mask_frames"
        x: 511
        y: 98
        currentFrame: rpm_frame
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
        interval: 100
        repeat: true
        running: true

        onTriggered: {
            tickCounter++;
            stageTick++;

            // WARNING INDICATION LOGIC (Battery, Service, Engine, Fuel)
            switch(tickCounter) {
            case 50:
                batteryState = 1;
                break;
            case 80:
                blinkStage = 1;
                break;
            case 90:
                batteryState = 2;
                lowbatteryflag = true;
                break;
            case 100:
                serviceflag = true;
                batterysymbolflag = false;
                fuelsymbolflag = true;
                lowbatteryflag = false;
                break;
            case 130:
                fuelState = 1;
                break;
            case 150:
                engineflag = true;
                blinkStage = 1;
                break;
            case 160:
                fuelState = 2;
                break;
            case 190:
                fuelState = 3;
                lowfuelflag = true;
                break;
            case 200:
                lowfuelflag = false;
                showResultScreen();
                break;
            }

            // INDICATOR SEQUENCE (EVERY 2 SEC)
            if (stageTick >= 20) {
                stageTick = 0;
                indicatorStage = (indicatorStage + 1) % 3;
            }

            switch (indicatorStage) {
            case 0:
                leftindicatorflag = false;
                rightindicatorflag = true;
                break;
            case 1:
                leftindicatorflag = true;
                rightindicatorflag = true;
                break;
            case 2:
                leftindicatorflag = true;
                rightindicatorflag = false;
                break;
            }

            // DIPPER BLINKING AT 8s & 15s
            if (blinkStage > 0) {
                if (blinkStage % 5 === 0) {
                    dipperflag = !dipperflag;
                }
                blinkStage++;

                if (blinkStage > 20) {
                    blinkStage = 0;
                    dipperflag = false;
                }
            }

            // ANIMATION FRAME UPDATE
            switch (phase) {
            case phaseForward1:
                animation_frame++;
                if (animation_frame >= leftframeCount - 1)
                    phase = phaseReverse1;
                break;
            case phaseReverse1:
                animation_frame--;
                if (animation_frame <= 13)
                    phase = phaseForward2;
                break;
            case phaseForward2:
                animation_frame++;
                if (animation_frame >= 30)
                    phase = phaseReverse2;
                break;
            case phaseReverse2:
                animation_frame--;
                if (animation_frame <= 3)
                    phase = phaseForward3;
                break;
            case phaseForward3:
                animation_frame++;
                if (animation_frame >= 21)
                    phase = phaseForward1;
                break;
            }

            // CALCULATE KM/H & RPM %
            if (animation_frame > 0 && animation_frame <= 4) {
                gear_value = 1;
                kmh_value = 3 + ((animation_frame - 1) * 7 / 3);
            } else if (animation_frame > 4 && animation_frame <= 10) {
                gear_value = 2;
                kmh_value = 10 + ((animation_frame - 4) * 20 / 6);
            } else if (animation_frame > 10 && animation_frame <= 20) {
                gear_value = 3;
                kmh_value = 30 + ((animation_frame - 10) * 20 / 10);
            } else if (animation_frame > 20 && animation_frame <= 30) {
                gear_value = 4;
                kmh_value = 50 + ((animation_frame - 20) * 30 / 10);
            } else if (animation_frame > 30 && animation_frame <= 39) {
                gear_value = 5;
                kmh_value = 80 + ((animation_frame - 30) * 40 / 9);
            } else {
                gear_value = 0;
                kmh_value = 0;
            }

            rpm_percent = (kmh_value * 100) / 120;
            rpm_frame = (rpm_percent * 39) / 100;

            // TOTAL KM (0 → 200)
            if (tickCounter < 200) {
                totalKM++;
            }
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
}
