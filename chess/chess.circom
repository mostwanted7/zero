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
   signal input start[2]; // Start position
   signal input end[2]; // End position
   
   // Check that there is a piece at start position
   log("BOARD VALUE AT POSITION:");
   log(board[start[0]][start[1]]); 
   assert(board[start[0]][start[1]] != 0);
   // Check that the piece is white
   assert(board[start[0]][start[1]] % 2 == 1);

   
}

component main = Main();