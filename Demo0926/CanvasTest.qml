import QtQuick 2.0


Canvas{
    id: root

    width: 500; height: 600

    onPaint: {
        var ctx = getContext("2d")

        ctx.lineWidth = 2

        ctx.strokeStyle = "blue"
        ctx.fillStyle = "lightgray"

        ctx.beginPath()
        ctx.moveTo(50, 50)
        ctx.lineTo(250, 50)
        ctx.lineTo(150, 180)
        ctx.closePath()

        ctx.fill()
        ctx.stroke()

         ctx.fillStyle = "lightblue"
        ctx.beginPath()
        ctx.moveTo(150, 20)
        ctx.lineTo(90, 150)
        ctx.lineTo(210, 150)

        ctx.closePath()
        ctx.fill()
        ctx.stroke()
    }
}
