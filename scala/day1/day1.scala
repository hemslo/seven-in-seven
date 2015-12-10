// Write a game that will take a tic-tac-toe board with X, O, and blank characters and detect the winner or whether there is a tie or no winner yet. Use classes where appropriate.
// Bonus problem: Let two players play tic-tac-toe.

class TicTacToe {
  var board = ('1' to '9').toList
  val lines = List((0,1,2), (3,4,5), (6,7,8), (0,3,6), (1,4,7), (2,5,8), (0,4,8), (2,4,6))
  var turn = 'X'

  def availableMoves = board.filter(e => e != 'X' && e != 'O')

  def play(move : Char, mark : Char) = board.updated(board.indexOf(move), mark)

  def isDraw = board.forall(e => e == 'X' || e == 'O')

  def isWinner(mark : Char) = lines.exists { case (i,j,k) => board(i) == mark && board(j) == mark && board(k) == mark }

  def isOver = isWinner('X') || isWinner('O') || isDraw

  def show {
    board.grouped(3).foreach(row => println(row(0) + " " + row(1) + " " + row(2)))
  }

  def printOverMessage {
    if (isWinner('X')) println("X win")
    else if (isWinner('O')) println("O win")
    else if (isDraw) println("tie")
    else println("no winner yet")
  }

  def readValidMove() : Char = {
    print("Choose a move: ")
    val validMoves = availableMoves
    val move = readChar
    if (validMoves.contains(move)) {
      move
    } else {
      println("Invalid move. Choose another one in " + validMoves)
      readValidMove()
    }
  }

  def start {
    show
    while(!isOver) {
      board = play(readValidMove, turn)
      if(turn == 'X') {
        turn = 'O'
      } else {
        turn = 'X'
      }
      show
    }
    printOverMessage
  }
}

new TicTacToe().start
