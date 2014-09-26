import QtQuick 2.0

Rectangle {
    width: 500
    height: 600

    Canvas{
        id: canvas

        width: 100; height: 100
        property real hue: 0.0

        onPaint: {
            var ctx = getContext("2d")

            var x = 10 + Math.random(80) * 80
            var y = 10 + Math.random(80)*80

            hue += Math.random() *0.1

            if(hue > 1.0) { hue -= 1}
            ctx.globalAlpha = 0.7
            ctx.fillStyle = Qt.hsla(hue, Math.random(), Math.random(), 1.0)

            ctx.beginPath()
            ctx.moveTo(x+5,y)
            ctx.arc(x,y, x/10,0,360)
            ctx.closePath()
            ctx.fill()

        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                    canvas.requestPaint()
            }

            // Double click save the canvas
           onDoubleClicked: {
               var url = canvas.toDataURL('image/png')
               // Save canvas as a image
               canvas.save("image.png")
               print("image url=", url)
               image.source = url
           }
        }
    }

    Image{
        id: image
        x:130; y:10
        width:100; height:100
    }
}
