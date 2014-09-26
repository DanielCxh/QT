import QtQuick 2.0

Canvas{
    id: root

    width: 500; height: 600

    property int newRoation: 0

    onPaint: {
        var ctx = getContext("2d")

        ctx.drawImage("./earth.jpg", 0,0, 300,300)
        ctx.save()

        ctx.strokeStyle = 'red'

//        ctx.beginPath()
//        ctx.moveTo(0,0)
//        ctx.lineTo(200,0)
//        ctx.lineTo(200,200)
//        ctx.closePath()

        ctx.rotate(newRoation)
        //ctx.resetTransform()
       // ctx.drawImage
    }

    Component.onCompleted: {
        loadImage("./earth.jpg")
    }

    Timer{
         id: time
         interval: 500; running: true; repeat: true
         onTriggered: {
            console.log(newRoation)
             newRoation += 5
         }
    }
}
