import QtQuick 2.2

Rectangle {
    width: 360
    height: 360

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Qt.quit();
        }
    }

    Text {
        id: info
        anchors.centerIn: parent
        text: "Hello World"
    }


        Rectangle{
            width: 200; height:200

            color:"lightblue"

            ListModel{
                id : myListModel
                ListElement{name:"aaa"; surfaceColor:"gray"}
                ListElement{name:"bbb"; surfaceColor:"red"}
                ListElement{name:"ccc"; surfaceColor:"orange"}
                ListElement{name:"ddd"; surfaceColor:"blue"}
                ListElement{name:"eee"; surfaceColor:"green"}
            }

            GridView{
                id: gridVied
                anchors.fill: parent
                model: myListModel
                delegate: myDelegate

                clip: true

                cellWidth: 24;
                cellHeight: 24

                add: Transition{
                            NumberAnimation{
                                target: part
                                property:"scale"
                                from:0 ; to:1
                                 duration: 250
                                 easing.type: Easing.InOutQuad
                            }
                         }

                remove:  Transition{
                    NumberAnimation{
                        target: part
                        property:"scale"
                        from:1 ; to:0
                         duration: 250
                         easing.type: Easing.InOutQuad
                    }
                 }
            }

            Component{
                id: myDelegate
                Rectangle{
                    id: part
                    width: 20; height: 20
                    y:3; x:3
                    radius: 6
                    color: "white"

                    Text {
                        anchors.centerIn: parent
                        text: index
                    }
                }
            }
   }

        Btn_T1{
            x:200
            text: "Add"
            onClicked: {
            myListModel.append({"name":"fff","surfaceColor":"black"})
            }
        }

        Btn_T1{
            x:200
            y:100
            text: "Remove"
            onClicked: {
                if(myListModel.count - 1>0 || myListModel.count - 1==0) {
            myListModel.remove((myListModel.count - 1))
            }}
        }


    // -------------------------------List View
    Rectangle{
            width: 200; height: 330
            x:0; y:200

            color: "lightgray"

            ListView{
                anchors.fill: parent
                anchors.margins: 10

                clip: true
                spacing: 3

                model: 20
                delegate: numberDelegate
//             snapMode:ListView.SnapOneItem
                //boundsBehavior: Flickable.DragOverBounds

                //orientation: ListView.Horizontal
                highlight: highlightCom

                focus: true

                header: headerCom
                footer: footCom
            }

            Component{
                id: highlightCom

                Rectangle{
                    width: 50; height:58
                    color:"black"
                }
            }

            Component{
                id: headerCom

                Rectangle{
                    width: 50; height:58
                    color:"black"
                }
            }

            Component{
                id: footCom

                Rectangle{
                    width: 50; height:58
                    color:"blue"
                }
            }

            Component{
                id: numberDelegate

                Rectangle{

                    width:50; height:50
                    color: ListView.isCurrentItem ? "yellow":"red"

                    Btn_T1{
                        anchors.centerIn: parent
                        text: index
                        fontSize: 16
                        onClicked: {
                                info.text = "Click " + this.text;
                    }
                }
                }
//                Btn_T1{
//                    //anchors.centerIn: parent
//                    text: index
//                    fontSize: 16
//                    onClicked: {
//                            info.text = "Click " + this.text;
//                    }
//                }
            }
    }
}

