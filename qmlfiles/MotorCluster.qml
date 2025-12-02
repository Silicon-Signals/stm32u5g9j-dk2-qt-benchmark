import QtQuick

Item {
    id: cluster
    width: 800
    height: 480

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
        id: clusterBg
        anchors.centerIn: parent
        width: 800
        height: 480
        source: "images/cluster_bg.png"
        fillMode: Image.PreserveAspectFit

        Image {
            id: leftIndicator
            x: 181
            y: 30
            width: 51
            height: 41
            source: "images/left_indicator.png"
            fillMode: Image.PreserveAspectFit
            visible: !leftindicatorflag
        }

        Image {
            id: leftIndicatorlight
            x: 181
            y: 30
            width: 51
            height: 41
            source: "images/left_indicator_colored.png"
            fillMode: Image.PreserveAspectFit
            visible: leftindicatorflag
        }

        Image {
            id: rightIndicator
            x: 569
            y: 30
            width: 51
            height: 41
            source: "images/right_indicator.png"
            fillMode: Image.PreserveAspectFit
            visible: !rightindicatorflag
        }

        Image {
            id: rightIndicatorlight
            x: 569
            y: 30
            width: 51
            height: 41
            source: "images/right_indicator_colored.png"
            fillMode: Image.PreserveAspectFit
            visible: rightindicatorflag
        }

        Image {
            id: dipper
            x: 273
            y: 30
            width: 58
            height: 41
            source: "images/dipper.png"
            fillMode: Image.PreserveAspectFit
            visible: !dipperflag
        }

        Image {
            id: dipperlight
            x: 273
            y: 30
            width: 58
            height: 41
            source: "images/dipper_colored.png"
            fillMode: Image.PreserveAspectFit
            visible: dipperflag
        }

        Image {
            id: engine
            x: 371
            y: 30
            width: 63
            height: 42
            source: "images/engine.png"
            fillMode: Image.PreserveAspectFit
            visible: !engineflag
        }

        Image {
            id: enginelight
            x: 371
            y: 30
            width: 63
            height: 42
            source: "images/engine_colored.png"
            fillMode: Image.PreserveAspectFit
            visible: engineflag
        }

        Image {
            id: service
            x: 478
            y: 30
            width: 54
            height: 47
            source: "images/service.png"
            fillMode: Image.PreserveAspectFit
            visible: !serviceflag
        }

        Image {
            id: servicelight
            x: 478
            y: 30
            width: 54
            height: 47
            source: "images/service_colored.png"
            fillMode: Image.PreserveAspectFit
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

        Image {
            id: speed0
            source: "left_speedometer_mask_frames/left_frame_000.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 0
        }
        Image {
            id: speed1
            source: "left_speedometer_mask_frames/left_frame_001.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 1
        }
        Image {
            id: speed2
            source: "left_speedometer_mask_frames/left_frame_002.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 2
        }
        Image {
            id: speed3
            source: "left_speedometer_mask_frames/left_frame_003.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 3
        }
        Image {
            id: speed4
            source: "left_speedometer_mask_frames/left_frame_004.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 4
        }
        Image {
            id: speed5
            source: "left_speedometer_mask_frames/left_frame_005.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 5
        }
        Image {
            id: speed6
            source: "left_speedometer_mask_frames/left_frame_006.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 6
        }
        Image {
            id: speed7
            source: "left_speedometer_mask_frames/left_frame_007.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 7
        }
        Image {
            id: speed8
            source: "left_speedometer_mask_frames/left_frame_008.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 8
        }
        Image {
            id: speed9
            source: "left_speedometer_mask_frames/left_frame_009.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 9
        }
        Image {
            id: speed10
            source: "left_speedometer_mask_frames/left_frame_010.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 10
        }
        Image {
            id: speed11
            source: "left_speedometer_mask_frames/left_frame_011.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 11
        }
        Image {
            id: speed12
            source: "left_speedometer_mask_frames/left_frame_012.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 12
        }
        Image {
            id: speed13
            source: "left_speedometer_mask_frames/left_frame_013.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 13
        }
        Image {
            id: speed14
            source: "left_speedometer_mask_frames/left_frame_014.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 14
        }
        Image {
            id: speed15
            source: "left_speedometer_mask_frames/left_frame_015.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 15
        }
        Image {
            id: speed16
            source: "left_speedometer_mask_frames/left_frame_016.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 16
        }
        Image {
            id: speed17
            source: "left_speedometer_mask_frames/left_frame_017.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 17
        }
        Image {
            id: speed18
            source: "left_speedometer_mask_frames/left_frame_018.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 18
        }
        Image {
            id: speed19
            source: "left_speedometer_mask_frames/left_frame_019.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 19
        }
        Image {
            id: speed20
            source: "left_speedometer_mask_frames/left_frame_020.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 20
        }
        Image {
            id: speed21
            source: "left_speedometer_mask_frames/left_frame_021.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 21
        }
        Image {
            id: speed22
            source: "left_speedometer_mask_frames/left_frame_022.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 22
        }
        Image {
            id: speed23
            source: "left_speedometer_mask_frames/left_frame_023.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 23
        }
        Image {
            id: speed24
            source: "left_speedometer_mask_frames/left_frame_024.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 24
        }
        Image {
            id: speed25
            source: "left_speedometer_mask_frames/left_frame_025.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 25
        }
        Image {
            id: speed26
            source: "left_speedometer_mask_frames/left_frame_026.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 26
        }
        Image {
            id: speed27
            source: "left_speedometer_mask_frames/left_frame_027.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 27
        }
        Image {
            id: speed28
            source: "left_speedometer_mask_frames/left_frame_028.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 28
        }
        Image {
            id: speed29
            source: "left_speedometer_mask_frames/left_frame_029.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 29
        }
        Image {
            id: speed30
            source: "left_speedometer_mask_frames/left_frame_030.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 30
        }
        Image {
            id: speed31
            source: "left_speedometer_mask_frames/left_frame_031.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 31
        }
        Image {
            id: speed32
            source: "left_speedometer_mask_frames/left_frame_032.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 32
        }
        Image {
            id: speed33
            source: "left_speedometer_mask_frames/left_frame_033.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 33
        }
        Image {
            id: speed34
            source: "left_speedometer_mask_frames/left_frame_034.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 34
        }
        Image {
            id: speed35
            source: "left_speedometer_mask_frames/left_frame_035.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 35
        }
        Image {
            id: speed36
            source: "left_speedometer_mask_frames/left_frame_036.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 36
        }
        Image {
            id: speed37
            source: "left_speedometer_mask_frames/left_frame_037.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 37
        }
        Image {
            id: speed38
            source: "left_speedometer_mask_frames/left_frame_038.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 38
        }
        Image {
            id: speed39
            source: "left_speedometer_mask_frames/left_frame_039.png"
            width: 300
            height: 300
            x: -10
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: leftframeIndex == 39
        }
        Image {
            id: rpmframe0
            source: "right_speedometer_mask_frames/right_frame_000.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 0
        }
        Image {
            id: rpmframe1
            source: "right_speedometer_mask_frames/right_frame_001.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 1
        }
        Image {
            id: rpmframe2
            source: "right_speedometer_mask_frames/right_frame_002.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 2
        }
        Image {
            id: rpmframe3
            source: "right_speedometer_mask_frames/right_frame_003.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 3
        }
        Image {
            id: rpmframe4
            source: "right_speedometer_mask_frames/right_frame_004.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 4
        }
        Image {
            id: rpmframe5
            source: "right_speedometer_mask_frames/right_frame_005.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 5
        }
        Image {
            id: rpmframe6
            source: "right_speedometer_mask_frames/right_frame_006.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 6
        }
        Image {
            id: rpmframe7
            source: "right_speedometer_mask_frames/right_frame_007.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 7
        }
        Image {
            id: rpmframe8
            source: "right_speedometer_mask_frames/right_frame_008.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 8
        }
        Image {
            id: rpmframe9
            source: "right_speedometer_mask_frames/right_frame_009.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 9
        }
        Image {
            id: rpmframe10
            source: "right_speedometer_mask_frames/right_frame_010.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 10
        }
        Image {
            id: rpmframe11
            source: "right_speedometer_mask_frames/right_frame_011.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 11
        }
        Image {
            id: rpmframe12
            source: "right_speedometer_mask_frames/right_frame_012.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 12
        }
        Image {
            id: rpmframe13
            source: "right_speedometer_mask_frames/right_frame_013.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 13
        }
        Image {
            id: rpmframe14
            source: "right_speedometer_mask_frames/right_frame_014.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 14
        }
        Image {
            id: rpmframe15
            source: "right_speedometer_mask_frames/right_frame_015.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 15
        }
        Image {
            id: rpmframe16
            source: "right_speedometer_mask_frames/right_frame_016.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 16
        }
        Image {
            id: rpmframe17
            source: "right_speedometer_mask_frames/right_frame_017.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 17
        }
        Image {
            id: rpmframe18
            source: "right_speedometer_mask_frames/right_frame_018.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 18
        }
        Image {
            id: rpmframe19
            source: "right_speedometer_mask_frames/right_frame_019.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 19
        }
        Image {
            id: rpmframe20
            source: "right_speedometer_mask_frames/right_frame_020.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 20
        }
        Image {
            id: rpmframe21
            source: "right_speedometer_mask_frames/right_frame_021.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 21
        }
        Image {
            id: rpmframe22
            source: "right_speedometer_mask_frames/right_frame_022.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 22
        }
        Image {
            id: rpmframe23
            source: "right_speedometer_mask_frames/right_frame_023.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 23
        }
        Image {
            id: rpmframe24
            source: "right_speedometer_mask_frames/right_frame_024.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 24
        }
        Image {
            id: rpmframe25
            source: "right_speedometer_mask_frames/right_frame_025.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 25
        }
        Image {
            id: rpmframe26
            source: "right_speedometer_mask_frames/right_frame_026.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 26
        }
        Image {
            id: rpmframe27
            source: "right_speedometer_mask_frames/right_frame_027.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 27
        }
        Image {
            id: rpmframe28
            source: "right_speedometer_mask_frames/right_frame_028.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 28
        }
        Image {
            id: rpmframe29
            source: "right_speedometer_mask_frames/right_frame_029.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 29
        }
        Image {
            id: rpmframe30
            source: "right_speedometer_mask_frames/right_frame_030.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 30
        }
        Image {
            id: rpmframe31
            source: "right_speedometer_mask_frames/right_frame_031.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 31
        }
        Image {
            id: rpmframe32
            source: "right_speedometer_mask_frames/right_frame_032.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 32
        }
        Image {
            id: rpmframe33
            source: "right_speedometer_mask_frames/right_frame_033.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 33
        }
        Image {
            id: rpmframe34
            source: "right_speedometer_mask_frames/right_frame_034.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 34
        }
        Image {
            id: rpmframe35
            source: "right_speedometer_mask_frames/right_frame_035.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 35
        }
        Image {
            id: rpmframe36
            source: "right_speedometer_mask_frames/right_frame_036.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 36
        }
        Image {
            id: rpmframe37
            source: "right_speedometer_mask_frames/right_frame_037.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 37
        }
        Image {
            id: rpmframe38
            source: "right_speedometer_mask_frames/right_frame_038.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 38
        }
        Image {
            id: rpmframe39
            source: "right_speedometer_mask_frames/right_frame_039.png"
            width: 300
            height: 300
            x: 511
            y: 98
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            visible: rightframeIndex == 39
        }

        Image {
            id: fullfuel
            x: 37
            y: 434
            width: 130
            height: 14
            source: "images/fuel_full.png"
            visible: fuelState == 0
        }

        Image {
            id: fuel80
            x: 37
            y: 434
            width: 130
            height: 14
            source: "images/fuel_80.png"
            visible: fuelState == 1
        }

        Image {
            id: fuel50
            x: 37
            y: 434
            width: 130
            height: 14
            source: "images/fuel_50.png"
            visible: fuelState == 2
        }

        Image {
            id: lowFuel
            x: 37
            y: 434
            width: 130
            height: 14
            source: "images/fuel_low.png"
            visible: fuelState == 3
        }

        Image {
            id: fuelSymbol
            x: 186
            y: 426
            width: 30
            height: 30
            source: "images/fuel_indicator.png"
            visible: !fuelsymbolflag
        }

        Image {
            id: fuelSymbolcolour
            x: 186
            y: 426
            width: 30
            height: 30
            source: "images/fuel_indicator_colored.png"
            visible: fuelsymbolflag
        }

        Image {
            id: batteryfull
            x: 614
            y: 272
            width: 170
            height: 150
            source: "images/battery_full.png"
            visible: batteryState == 0
        }

        Image {
            id: batteryhalf
            x: 614
            y: 272
            width: 170
            height: 150
            source: "images/battery_half.png"
            visible: batteryState == 1
        }

        Image {
            id: batterylow
            x: 614
            y: 272
            width: 170
            height: 150
            source: "images/battery_low.png"
            visible: batteryState == 2
        }

        Image {
            id: batterySymbol
            x: 740
            y: 349
            width: 40
            height: 40
            source: "images/battery.png"
            visible: !batterysymbolflag
        }

        Image {
            id: batterySymbolcolour
            x: 740
            y: 349
            width: 40
            height: 40
            source: "images/battery_colored.png"
            visible: batterysymbolflag
        }
    }

    Timer {
        id: masterTimer
        interval: 500
        repeat: true
        running: true

        onTriggered: {
            tickCount++

            //  INDICATOR SEQUENCE (EVERY 2 SEC)
            stageTick++

            if (stageTick >= 4) {
                stageTick = 0
                indicatorStage = (indicatorStage + 1) % 3
            }

            if (indicatorStage == 0) {
                leftindicatorflag = false
                rightindicatorflag = true
            } else if (indicatorStage == 1) {
                leftindicatorflag = true
                rightindicatorflag = true
            } else if (indicatorStage == 2) {
                leftindicatorflag = true
                rightindicatorflag = false
            }

            // DIPPER BLINKING AT 8s & 15s
            if (tickCount == 16 || tickCount == 30) {
                blinkStage = 1
            }

            if (blinkStage > 0) {
                dipperflag = ((dipperflag === false) ? true : false);
                blinkStage++

                if (blinkStage > 4) {
                    blinkStage = 0
                    dipperflag = false
                }
            }

            // SERVICE ON and Change BATTERY to FUEL AT 10s
            if (tickCount == 20) {
                serviceflag = true
                batterysymbolflag = false
                fuelsymbolflag = true
                lowbatteryflag = false
            }

            // ENGINE ON AT 15s
            if (tickCount == 30) {
                engineflag = true
            }

            // STATE MACHINE for BATTERY STATUS
            if (tickCount == 10) {
                batteryState = 1
            }
            if (tickCount == 18) {
                batteryState = 2
                lowbatteryflag = true
            }

            // STATE MACHINE for FUEL STATUS
            if (tickCount == 26) {
                fuelState = 1
            }
            if (tickCount == 32) {
                fuelState = 2
            }
            if (tickCount == 38) {
                fuelState = 3
                lowfuelflag = true
            }
            if (tickCount == 40) {
                lowfuelflag = false
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
                currentKm++
            }

            // Speed and Frame Mapping
            switch (phase) {
            case phaseForward1:
                leftframeIndex++
                if (leftframeIndex >= leftframeCount - 1)
                    phase = phaseReverse1
                break
            case phaseReverse1:
                leftframeIndex--
                if (leftframeIndex <= 13)
                    phase = phaseForward2
                break
            case phaseForward2:
                leftframeIndex++
                if (leftframeIndex >= 30)
                    phase = phaseReverse2
                break
            case phaseReverse2:
                leftframeIndex--
                if (leftframeIndex <= 3)
                    phase = phaseForward3
                break
            case phaseForward3:
                leftframeIndex++
                if (leftframeIndex >= 21)
                    phase = phaseForward1
                break
            }

            // Gear and Speed Mapping
            if (leftframeIndex >= 1 && leftframeIndex <= 4) {
                gearcounter = 1
                speedcounter = 3 + ((leftframeIndex - 1) * 7 / 3)
            } else if (leftframeIndex >= 4 && leftframeIndex <= 10) {
                gearcounter = 2
                speedcounter = 10 + ((leftframeIndex - 4) * 20 / 6)
            } else if (leftframeIndex >= 10 && leftframeIndex <= 20) {
                gearcounter = 3
                speedcounter = 30 + ((leftframeIndex - 10) * 20 / 10)
            } else if (leftframeIndex >= 20 && leftframeIndex <= 30) {
                gearcounter = 4
                speedcounter = 50 + ((leftframeIndex - 20) * 30 / 10)
            } else if (leftframeIndex >= 30 && leftframeIndex <= 39) {
                gearcounter = 5
                speedcounter = 80 + ((leftframeIndex - 30) * 40 / 9)
            } else {
                gearcounter = 0
                speedcounter = 0
            }

            // RPM Percentage (0–100%)
            rpmcounter = Math.floor((speedcounter * 100) / 120)

            if (rpmcounter < 0)
                rpmcounter = 0
            if (rpmcounter > 100)
                rpmcounter = 100

            rightframeIndex = (rpmcounter * 39) / 100
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
            width: 30
            height: 30
            source: "images/battery_notifictation.png"
            fillMode: Image.PreserveAspectFit
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
            width: 30
            height: 30
            source: "images/fuel_indicator.png"
            fillMode: Image.PreserveAspectFit
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
