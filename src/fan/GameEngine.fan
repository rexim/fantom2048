
class GameEngine: IController {
    new make() {
        addRandomValue();
        addRandomValue();
    }

    override Void moveLeft() {
        squashBoard();
        addRandomValue();
    }

    override Void moveRight() {
        board.rotate(2);
        squashBoard();
        board.rotate(-2);
        addRandomValue();
    }

    override Void moveUp() {
        board.rotate(-1);
        squashBoard();
        board.rotate(1);
        addRandomValue();
    }

    override Void moveDown() {
        board.rotate(1);
        squashBoard();
        board.rotate(-1);
        addRandomValue();
    }

    private Void squashBoard() {
        for (i := 0; i < board.getRows(); ++i) {
            squashRow(i);
        }
    }

    private Void squashRow(Int row) {
        stack := Int[,];
        squashedPair := false;
        for (j := 0; j < board.getColumns; ++j) {
            if (stack.isEmpty || stack.last != board.get(row, j) || squashedPair) {
                stack.push(board.get(row, j))
                squashedPair = false;
            } else {
                x := stack.pop();
                stack.push(x + board.get(row, j));
                squashedPair = true;
            }
            board.set(row, j, 0);
        }
    }

    private Void addRandomValue() {
        emptyCells := collectEmptyCells();
        if (!emptyCells.isEmpty) {
            randomEmptyCell := emptyCells[Int.random(0 .. emptyCells.size - 1)];
            board.set(randomEmptyCell[0], randomEmptyCell[1], Int.random(1 .. 2) * 2);
        }
    }

    private Int[][] collectEmptyCells() {
        emptyCells := Int[][,];

        for (i := 0; i < board.getRows; ++i) {
            for (j := 0; j < board.getColumns; ++j) {
                if (board.get(i, j) == 0) {
                    emptyCells.push([i, j]);
                }
            }
        }

        return emptyCells;
    }

    IRenderer? renderer := null {
        set {
            &renderer = it;
            if (&renderer != null) {
                &renderer.render(board.toList);
            }
        }
    };

    private Board board := Board.make(4, 4);
}
