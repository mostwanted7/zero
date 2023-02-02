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
    signal output piece;
    var board[8][8] = getBoard(); 
    var pieceVar = board[start[0]][start[1]];
    log(pieceVar);
    pieceVar = pieceVar % 2; 
    piece <-- pieceVar;
    piece === 1;

}


component main = Main();