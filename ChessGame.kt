class Piece(val name: String, var x: Int, var y: Int)

class ChessBoard {
    val pieces = mutableListOf<Piece>()
    fun addPiece(name: String, x: Int, y: Int) {
        pieces.add(Piece(name, x, y))
    }
    fun movePiece(name: String, newX: Int, newY: Int) {
        val piece = pieces.find { it.name == name }
        piece?.let {
            it.x = newX
            it.y = newY
        }
    }
    fun showBoard() {
        println("Chess Board:")
        for (p in pieces) {
            println("${p.name} at (${p.x},${p.y})")
        }
    }
}

fun main() {
    val board = ChessBoard()
    board.addPiece("WhiteKing", 4, 0)
    board.addPiece("BlackKing", 4, 7)
    board.addPiece("WhitePawn", 4, 1)
    board.addPiece("BlackPawn", 4, 6)
    for (i in 1..4) {
        if (i % 2 == 0) {
            board.movePiece("WhitePawn", 4, 2 + i / 2)
        } else {
            board.movePiece("BlackPawn", 4, 6 - i / 2)
        }
        board.showBoard()
    }
    println("Chess Game Ended.")
}