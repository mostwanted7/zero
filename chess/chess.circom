pragma circom 2.0.0;


/*
Board from white perspective
Odd numbers indicate white pieces
Double the value for black piece
Each piece is assigned a number:
0 - No piece
1 - King
3 - Queen
5 - Rook

*/
function getBoard() {
    return[
    [0,0,0,0,0,0,0,2], //8
    [0,0,0,0,0,0,0,0], //7
    [0,0,0,0,0,1,3,0], //6
    [0,0,0,0,0,0,0,0], //5
    [0,0,0,0,0,0,0,0], //4
    [0,0,0,0,0,0,0,0], //3
    [0,0,0,0,0,0,0,0], //2
    [0,0,0,0,0,0,0,0] //1
    ];
}



template Main() {
   
    var board[8][8] = getBoard(); 
    signal input start[2];
    signal input end[2];
    component checkMove = valid();    
    checkMove.start <== start;
    checkMove.end <== end;

}

template valid() {

    /*
    Checks if a valid piece is selected by checking
    that the selected square has an odd number piece
    */
    signal input start[2]; 
    signal input end[2];
    signal piece;
    signal ender;
    var board[8][8] = getBoard(); 
    var pieceVar = board[start[0]][start[1]];
    var endX = end[0];
    var endY = end[1];
    log("CHOSEN PIECE");
    log(pieceVar);
    pieceVar = pieceVar % 2; 
    piece <-- pieceVar;
    piece === 1;
    /*
    Check if move is valid by checking
    whether end position for the piece is valid
    */
    /*
    Valid moves for each piece
    TO DO: Make a function that does this (copy from other chess apps)
    */
    var moves3[12][2] = [[0,4],[1,5],[0,6],[1,6],[3,6],[4,6],[5,6],[6,6],[7,6],[1,7],[2,7],[3,7]];
    var endBool = 0;
    for(var i = 0; i < 12; i++) {
        if(moves3[i][0] == endX && moves3[i][1] == endY) {
            log(i);
            endBool = 1;
        }
    }
    ender <-- endBool;
    ender === 1;
}


component main = Main();