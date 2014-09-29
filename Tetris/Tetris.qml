import QtQuick 2.2
import "control.js" as Control


Rectangle {
    id: root
    width: 380
    height: 580

    property int game_staus: 0

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (0 == game_staus) {
                game_staus = 1;
            }

            if (1 == game_staus) {
                infoBar.visible = true;
                mainScrn.visible = true;
                thumbnail.visible = true;
            }
        }
    }

    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Left) {
                Control.moveLeft()
            } else if(event.key == Qt.Key_Right) {
                Control.moveRight()
            } else if(event.key == Qt.Key_Up) {
                Control.changeShape()
            } else if(event.key == Qt.Key_Down) {
                Control.moveDown()
                // mainScrn.repaint()
            } else {

            }
              mainScrn.repaint()
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Press to start game!"
    }

    InfoBar{
        id: infoBar
    }

    MainScrn{
        id: mainScrn
        y: 100

    }

    Thumbnail{
        id: thumbnail

        MouseArea {
            anchors.fill: parent
            onClicked: {
                  Control.createBlock()
                  mainScrn.repaint()
            }
        }
    }

    Component.onCompleted: {
        if (0 == game_staus){
            infoBar.visible = false;
            mainScrn.visible = false;
            thumbnail.visible = false;
        }

        Control.initMatrix()
    }

    Timer{
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                Control.moveDown()
                mainScrn.repaint()
            }
    }

}

