import QtQuick 2.2
import "Timer.js" as TIMER

Rectangle {
    width: 360
    height: 360

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            Qt.quit();
//        }
//    }

    Btn_T1 {
        id: firstBtn
        width: 100
        height: 60
        color: "#ea7025"
        text: "OK"

        fontSize: 25

        onClicked: {
            text = data;
           // rotationAni.running = true;
            //rotationAni.start();
            //parallelAnim.easing.type = Easing.InBounce
            parallelAnim.start()
        }
    }

    Rectangle{
        id: startPad

        width:220; height:100
        anchors.centerIn: parent
        color: "lightblue"
        radius: 10

        Text {
            anchors.centerIn: parent

            elide: Text.ElideRight
            style: Text.Sunken
            styleColor: "#FF4444"

            verticalAlignment: Text.AlignTop

            font.family: "Ubuntu"
            font.pixelSize: 28

            color: "blue"

            text: "Game Start"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                // Hide startPad
                startPad.visible = !startPad.visible
                TIMER.start();
            }
        }
    }

    Btn_T1 {
        id: btn_T11
        x: 130
        y: 22
        smooth: true
        focus: true
        onClicked:{
            btn_T11.x += 5;
            btn_T11.rotation += 5;
            btn_T11.scale -= 0.05
        }

        Keys.onUpPressed: {
            btn_T11.x -= 5;
            btn_T11.rotation -= 5;
            btn_T11.scale += 0.05
        }
    }

    Grid{
        id: gridRepeat
        anchors.fill: parent
        anchors.margins: 8
        spacing: 5

        Repeater{
            model: 16
            Btn_T1{
                    text: "Cell" + index
                    color: colorArray[Math.floor(Math.random()*3)]
            }
        }
    }

    TextInput{
        id: input1
        y: 260
        width: 200; height: 50

        text: "Please input"
        KeyNavigation.tab:  input2
        focus: true
    }
Rectangle{
    id: input
    y: 300
    width:100; height:50
    color:"lightblue"
    border.color: "black"

    TextEdit{
        id: input2

        anchors.fill: parent

        text: "Please input"
        KeyNavigation.tab: input1
    }

//    NumberAnimation on x {
//        to: 300
//        duration: 3000
//        loops: Animation.Infinite
//    }

//    RotationAnimation on rotation {
//        id: rotationAni
//        to: 360
//        duration: 3000
//        loops: Animation.Infinite
//        running: false
//    }
    Behavior on x {
        NumberAnimation { duration: 3000}
        enabled: false
    }

//    NumberAnimation{
//        id: anim
//        target:input
//        properties: "x"
//        from: 0
//        to: 200
//        duration: 3000

//    }

   // ParallelAnimation{
    SequentialAnimation{
        id: parallelAnim
        NumberAnimation{
            target:input
            properties: "x"
            from: input.x
            to: input.x + 200
            duration: 1000

        }

//        NumberAnimation{
//            target:input
//            properties: "y"
//            from: input.y
//            to: input.y + 100
//            duration: 1000

//        }

        NumberAnimation{
            target:input
            properties: "x"
            from: input.x
            to: input.x - 200
            duration: 1000
        }

//        NumberAnimation{
//            target:input
//            properties: "y"
//            from: input.y
//            to: input.y - 100
//            duration: 1000

//        }
    }

}

    Rectangle{
        id: ball
        width:40 ; height: 40
        color: "red"
        smooth: true
        x:300; y:300
        radius: 10


        MouseArea{
            anchors.fill: parent
            onClicked: {
                    ball.x = 300;
                    ball.y = 300;
                anim.start()
            }
        }

        SequentialAnimation{
             id: anim

        ParallelAnimation{

        SequentialAnimation{

             NumberAnimation{
                 target: ball
                 properties: "y"
                 to: 100
                 duration: 3000 * 0.4
                  easing.type: Easing.OutQuad
             }

             NumberAnimation{
                 target: ball
                 properties: "y"
                 to: 300
                 duration: 3000 * 0.6
                   easing.type: Easing.OutQuad
             }
        }

        NumberAnimation{
            target: ball
            properties: "x"
            to: 650
            duration: 3000
        }

        RotationAnimation{
            target: ball
            properties: "rotation"
            to: 720
            duration: 3000
        }

        }

        ParallelAnimation{

        SequentialAnimation{

             NumberAnimation{
                 target: ball
                 properties: "y"
                 to: 170
                 duration: 3000 * 0.4
             }

             NumberAnimation{
                 target: ball
                 properties: "y"
                 to: 300
                 duration: 3000 * 0.6
             }
        }

        NumberAnimation{
            target: ball
            properties: "x"
            to: 730
            duration: 3000
        }

        RotationAnimation{
            target: ball
            properties: "rotation"
            to: 180
            duration: 3000
        }

        }

        }

    }


}

