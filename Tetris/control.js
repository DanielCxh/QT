.pragma library

var matrix= new Array();

var block_11 = [
            [0,0,0,0],
            [0,11,11,0],
            [0,11,11,0],
            [0,0,0,0]
        ]

var block_12 = [
            [0,12,0,0],
            [0,12,0,0],
            [0,12,12,0],
            [0,0,0,0]
        ]

var block_13 = [
            [0,0,0,0],
            [0,13,0,0],
            [13,13,13,0],
            [0,0,0,0]
        ]

var newBlock;

function initMatrix(){
    var row = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    for(var i=0; i<24; i++) {
        matrix[i] = new Array();
        for(var j=0; j< 19; j++){
            matrix[i][j] = 0;
        }
    }
}

function func() {

}

function nextBlock(){

}

function createBlock(){
    newBlock = block_12;
    for(var i=0; i< newBlock.length; i++) {
        for(var j=0; j< newBlock[i].length; j++)
            matrix[i][j+7] = newBlock[i][j]
    }
}

function moveDown(){

   for(var i=matrix.length-1; i>=0; i--) {
       for(var j=0; j< matrix[i].length; j++) {
           if(matrix[i][j] != 0 && matrix[i][j] != 1){

               if (i == matrix.length-1) {
                   matrix[i][j] =1 ;
               } else {
                   // Cell touch Cell
                   if (matrix[i + 1][j] == 1) {
                       matrix[i][j] = 1;
                       fixAllCell();
                       break;
                   } else if(j != matrix[i].length-1 && (matrix[i][j + 1] > 1 && matrix[i + 1][j + 1] == 1) ){
                       matrix[i][j] = 1;
                       fixAllCell();
                       break;
                   }else if (matrix[i + 1][j] == 0){
                        matrix[i + 1][j] = matrix[i][j];
                       matrix[i][j] = 0;
                   }
               }
           }
       }
   }
}

function fixAllCell(){
    for(var i=0; i< matrix.length; i++) {
        for(var j=0; j< matrix[i].length; j++) {
            if(matrix[i][j] != 0 && matrix[i][j] != 1){
                matrix[i][j] = 1 ;
            }
        }
    }
}

function changeShape(){
    for(var i=0; i< matrix.length; i++) {
        for(var j=0; j< matrix[i].length; j++) {
            if(matrix[i][j] != 0 && matrix[i][j] != 1){
                matrix[i][j] =0 ;
            }
        }
    }
}

function moveLeft(){
    for(var i=matrix.length-1; i>=0; i--) {
        for(var j=0; j< matrix[i].length; j++) {
            if(matrix[i][j] != 0 && matrix[i][j] != 1){

                if(0 == j) {
                    break;
                } else {
                    if (matrix[i][j - 1] == 0){
                         matrix[i][j - 1] = matrix[i][j];
                        matrix[i][j] = 0;
                    }
                }
            }
        }
    }
}

function moveRight(){
  console.log("r")
}
