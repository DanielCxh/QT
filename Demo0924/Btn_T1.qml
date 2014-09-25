import QtQuick 2.0

Rectangle {
    id: button
    width: 100
    height: 60

    property int  fontSize: 20
    property string text: "Button"

    property variant colorArray:["#00bde3", "#67c111", "#ea7025"]

    signal clicked(var data)

    border.color: Qt.lighter(color)
    border.width: 2
    color: "green"

    radius: 8

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
        drag.target: parent

        onClicked: {
            // Do nothing.
            button.clicked(1);
        }

        onPressed: {
            button.opacity = 0.5
        }

        onReleased: {
             button.opacity = 1
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
