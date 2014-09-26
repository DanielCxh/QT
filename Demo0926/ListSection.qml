import QtQuick 2.0
/*
  * How to sort the data by "nation" ?
  */
Rectangle {
    width: 500
    height: 600

    ListView {
        anchors.fill: parent
        anchors.margins: 120

        clip: true

        //-----------Model
        model: spaceMen
        delegate: spaceMenDelegate

        section.property: "nation"
        section.delegate: sectionDelegate

        section.criteria: ViewSection.FullString
    }

    Component{
        id: spaceMenDelegate

        Item{
            width: 260
            height: 20

            Text{
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10

                font.pixelSize: 12

                text: name
            }
        }
    }

    Component{
        id: sectionDelegate

        Rectangle{
            width: 260
            height: 20

            color: "gray"

            Text{
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10

                font.pixelSize: 12
                font.bold: true

                // According section.property ?
                text: section

                color:"white"
            }
        }
    }

    ListModel{
        id: spaceMen

        ListElement{name:"Abdul Ahad Mohmand"; nation:"Afganistan"}
        ListElement{name:"Morcs Panot"; nation:"Brazil"}
        ListElement{name:"Abdul Ahad Mohmand"; nation:"Canada"}
        ListElement{name:"Stevent Maclean"; nation:"Afganistan"}
        ListElement{name:"Julie Payette"; nation:"Canada"}
        ListElement{name:"Dafyd Williamas"; nation:"Canada"}
        ListElement{name:"Abdul Ahad Mohmand1"; nation:"Afganistan"}

    }
}
