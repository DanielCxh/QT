import QtQuick 2.0
import "control.js" as Control

Rectangle {
    id: root
    width: 380
    height: 480
    color: "lightblue"

    property  variant mx
    property int cellSize: 20

//    GridView{
//        anchors.fill: parent

//        model: 19 * 24

//        cellHeight: 20;
//        cellWidth: 20;

//        delegate: viewDelegate

//    }

//    Component{
//        id: viewDelegate

//        Rectangle{
//            id: cell
//            width: 20; height: 20
//            color: {
//               if(Control.matrix[index]%2== 0) {
//                   console.log(Control.matrix[index])
//                   "red"
//               } else{
//                   "black"
//               }
//            }
//        }
//    }

    Canvas{
        id: canvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")

            drawCell(ctx)
        }

    }

    function repaint(){
        canvas.requestPaint()
    }

    function drawCell(ctx){

        for(var row=0; row<Control.matrix.length; row++){
            for(var colum=0; colum<Control.matrix[row].length; colum++){
                //if (0 != Control.matrix[row][colum]){

                    if (0 == Control.matrix[row][colum]) {
                        ctx.fillStyle = "lightblue"
                    } else if (1 == Control.matrix[row][colum]){
                        ctx.fillStyle = "blue"
                    } else {
                        ctx.fillStyle = "red"
                    }

                    ctx.fillRect(colum*cellSize, row*cellSize, cellSize, cellSize);
              //  }
            }
        }
    }
}
