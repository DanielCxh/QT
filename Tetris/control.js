.pragma library

var CanMove = true;
var matrix= new Array();

var block_11 = [
            [0,11,11,0],
            [0,11,11,0],
        ]

var block_12 = [
            [0,12,0,0],
            [0,12,0,0],
            [0,12,12,0],
        ]

var block_13 = [
            [0,13,0,0],
            [13,13,13,0],
        ]

var block_14 = [
            [0,13,0,0],
            [0,13,13,0],
            [0,13,0,0],
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

function createBlock(blockIndex){
    newBlock = block_13;
    switch(blockIndex) {
    case 0: newBlock = block_11;break;
    case 1:newBlock = block_12; break;
    case 2:newBlock = block_13;break;
    case 3:newBlock = block_14;break;
    default:
        break;
    }

    for(var i=0; i< newBlock.length; i++) {
        for(var j=0; j< newBlock[i].length; j++)
            matrix[i][j+7] = newBlock[i][j]
    }
}

function moveDown(){

   for(var i=matrix.length-1; i>=0; i--) {
       for(var j=0; j< matrix[i].length; j++) {
           if(matrix[i][j] !== 0 && matrix[i][j] !== 1){

               if (i == matrix.length-1) {
                   matrix[i][j] =1 ;
               } else {
                   // Cell touch Cell
                   if (matrix[i + 1][j] === 1) {
                       matrix[i][j] = 1;
                       fixAllCell();
                       break;
                   } else if(j != matrix[i].length-1 && (matrix[i][j + 1] > 1 && matrix[i + 1][j + 1] === 1) ){
                       matrix[i][j] = 1;
                       fixAllCell();
                       break;
                   }else if (matrix[i + 1][j] === 0){
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
            if(matrix[i][j] !== 0 && matrix[i][j] !== 1){
                matrix[i][j] = 1 ;
            }
        }
    }

    createBlock(Math.floor(Math.random()*4));
}

function changeShape(){
    console.log("u");
    for(var i=0; i< matrix.length; i++) {
        for(var j=0; j< matrix[i].length; j++) {
            if(matrix[i][j] !== 0 && matrix[i][j] !== 1 && i  !== j){
//                var tmp = i - j;
//                matrix[j + 5][i - 5] = matrix[i][j];
//                matrix[i][j] = 99;
            }
        }
    }
}

function moveLeft(){

        for(var j=0; j< matrix[0].length; j++) {

             for(var i=matrix.length-1; i>=0; i--) {
                 if (0 == j && matrix[i][j] > 1) {
                     CanMove = false;
                 }
                if(matrix[i][j] !== 0 && matrix[i][j] !== 1 && true == CanMove){

                        if (matrix[i][j - 1] === 0){
                             matrix[i][j - 1] = matrix[i][j];
                            matrix[i][j] = 0;
                    }
                }
        }
    }

         CanMove = true;
}

function moveRight(){
    for(var j=matrix[0].length -1 ; j>=0 ; j--) {

         for(var i=matrix.length-1; i>=0; i--) {
             if (matrix[0].length -1 == j && matrix[i][j] > 1) {
                 CanMove = false;
             }
            if(matrix[i][j] !== 0 && matrix[i][j] !== 1 && true === CanMove){

                    if (matrix[i][j + 1] === 0){
                         matrix[i][j + 1] = matrix[i][j];
                        matrix[i][j] = 0;
                }
            }
    }
}

     CanMove = true;
}
