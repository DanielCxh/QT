import QtQuick 2.0

Rectangle {
    id: button
    width: 50
    height: 50

    property int  fontSize: 10
    property string text: "Button"
    property bool  dragAble: false
    scale:1.0

    property variant colorArray:["#00bde3", "#67c111", "#ea7025"]

    signal clicked(var data)

    border.color: Qt.lighter(color)
    border.width: 1
    color: "green"

    radius: 10

    Text {
        id: text
        anchors.centerIn: parent

        elide: Text.ElideRight
        style: Text.Sunken
        styleColor: "black"

        verticalAlignment: Text.AlignTop

        font.family: "Ubuntu"
        font.pixelSize: button.fontSize

        color: "white"

        text: button.text
    }

    MouseArea {
        anchors.fill: parent
        //drag.target: parent

        // Only hoverEnabled is true, the onHoveredChanged is usefull.
        hoverEnabled: true

        onClicked: {
            // Do nothing.
            button.clicked(button.text);
        }

        onPressed: {
            button.opacity = 0.5
        }

        onReleased: {
             button.opacity = 1
        }

        onExited: {
            button.opacity = 1
            button.color = "green"
        }

        onHoveredChanged: {
            button.color =  "lightblue"
        }
    }

    states: [
        State {
            name: "normal"
            PropertyChanges {
                target: text

                color: "black"
                styleColor: "white"
            }
            when:button.opacity == 0.5
        },

        State {
            name: "press"
            PropertyChanges {
                target: text

            }
        }
    ]
}
