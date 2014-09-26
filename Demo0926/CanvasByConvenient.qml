import QtQuick 2.0

Canvas{
    id: root

    width: 500; height: 600

    onPaint: {
        var ctx = getContext("2d")

        ctx.lineWidth = 10

        ctx.strokeStyle = "black"
        ctx.fillStyle = "lightgray"

        ctx.fillRect(30,30,100,100);

        ctx.fillStyle = "blue"
        ctx.fillRect(40,40,100,100);

        ctx.clearRect(50,50,80,80);

        // Draw Rectangle by stroke color.
        ctx.strokeRect(20,20,40,40);

        //---------------------------Graients
        // Color line
        var gradient = ctx.createLinearGradient(100,100,200,200)

        // The stop color from (0, 0)~color line
        gradient.addColorStop(0, "blue")
        gradient.addColorStop(0.5, "lightsteelblue")
        ctx.fillStyle = gradient

       ctx.fillRect(0,0,300,300)

        ctx.strokeRect(100,100,200,200);
    }

}
