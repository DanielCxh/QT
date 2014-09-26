import QtQuick 2.0

Canvas{
    id: root

    width: 500; height: 600

    onPaint: {
        var ctx = getContext("2d")

        ctx.lineWidth = 2

        ctx.strokeStyle = "#333"

        ctx.fillRect(0,0,200,200);

        ctx.shadowColor = "white";
        ctx.shadowOffsetX = 4;
        ctx.shadowOffsetY = 4;

        ctx.font = '60px Ubuntu';
        ctx.fillStyle = "#33a9ff"
        ctx.fillText("Earth", 30,80)
    }
}
