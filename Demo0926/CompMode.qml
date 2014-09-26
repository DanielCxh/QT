import QtQuick 2.0

Canvas{
    id: root

    width: 500; height: 600

    property var operation:[
        "source-over","source-in","source-atop","destination-over","destination-in",
        "copy","xor","qt-clear","qt-color-dodge","qt-difference",
        "qt-hard-light","qt-soft-light"
    ]
/*
    onPaint: {
        var ctx = getContext("2d")

        ctx.globalCompositeOperation = "xor"
        ctx.fillStyle = "#33a9ff"

        for(var i=0; i<10; i++) {
            ctx.beginPath()
            ctx.arc(Math.random()*400, Math.random()*200, 20, 0, 2*Math.PI)
            ctx.closePath()
            ctx.fill()
        }

     }
*/
    onPaint: {
        var ctx = getContext("2d")

        for(var i=0; i<operation.length; i++) {
            var dx = Math.floor(i%5) * 140
            var dy = Math.floor(i/5) * 140

            ctx.save()
            ctx.fillStyle = "#33a9ff"
            ctx.fillRect(10+dx, 10+dy, 60, 60)

            ctx.globalCompositeOperation = root.operation[i]
            ctx.fillStyle = "#ff33a9"

            ctx.globalAlkpha = 0.75

            ctx.beginPath()
            ctx.arc(60+dx, 60+dy, 30, 0, 2*Math.PI)
            ctx.closePath()

            ctx.fill()
            ctx.restore()

            ctx.font = '18px Ubuntu';
            ctx.fillStyle = "#000000"
            ctx.fillText(root.operation[i], 10+dx,60+dy + 45)
        }
    }

}
