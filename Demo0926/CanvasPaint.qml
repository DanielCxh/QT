import QtQuick 2.0

Rectangle {
    id: root

    width: 500
    height: 600

    Rectangle{
         width:500; height: 100
         color: "black"

        Row{
            id: colorTool

            anchors.centerIn: parent
            spacing: 2
            //focus: true
            property string crtColor: ""

            Repeater{
                model: ["#33B5E5","#99CC00","#FFBB33"]

               Rectangle{
                   width: 50; height:50
                   color: modelData

                   MouseArea{
                       anchors.fill: parent
                       onClicked: {
                           console.log(modelData)
                           colorTool.crtColor = modelData
                       }
                   }
               }

            }

        }
    }

    Canvas{
        id: canvas

        y:100
        width:500; height: 500

        property real lastX
        property real lastY

        property real nX
        property real nY

        onPaint: {
            var ctx = getContext("2d")
           //ctx.clearRect(0, 0, 500, 500)
            ctx.lineWidth = 1.5
            ctx.strokeStyle = colorTool.crtColor

            ctx.beginPath();
            ctx.moveTo(lastX, lastY)

            lastX = drawArea.mouseX
            lastY = drawArea.mouseY

            ctx.lineTo(lastX, lastY)
            //ctx.strokeRect(lastX,lastY,2,2);

//             ctx.closePath()
             ctx.stroke()
        }

        MouseArea{
            id: drawArea
            anchors.fill: parent

            onPressed: {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
            }
            onReleased:  {
                canvas.nX = mouseX
                canvas.nY = mouseY
                canvas.requestPaint()
            }

            onPositionChanged: {
//                canvas.lastX = mouseX
//                canvas.lastY = mouseY
                canvas.requestPaint()
            }
        }
    }
}
