class Piece {
  String color;
  int x, y;
  Piece(this.color, this.x, this.y);
}

class CheckersBoard {
  List<Piece> pieces = [];
  void addPiece(String color, int x, int y) {
    pieces.add(Piece(color, x, y));
  }

  void movePiece(String color, int oldX, int oldY, int newX, int newY) {
    for (var p in pieces) {
      if (p.color == color && p.x == oldX && p.y == oldY) {
        p.x = newX;
        p.y = newY;
        break;
      }
    }
  }

  void showBoard() {
    print("Checkers Board:");
    for (var p in pieces) {
      print("${p.color} piece at (${p.x},${p.y})");
    }
  }
}

void main() {
  var board = CheckersBoard();
  board.addPiece("Red", 0, 0);
  board.addPiece("Black", 1, 1);
  for (var i = 0; i < 4; i++) {
    if (i % 2 == 0) {
      board.movePiece("Red", 0, 0, i, i);
    } else {
      board.movePiece("Black", 1, 1, i, i);
    }
    board.showBoard();
  }
  print("Checkers Game Ended.");
}