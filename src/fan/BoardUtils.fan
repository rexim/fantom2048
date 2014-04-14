
class BoardUtils {
    static Void addRandomValue(Board board) {
        emptyCells := collectEmptyCells(board);
        if (!emptyCells.isEmpty) {
            randomEmptyCell := emptyCells[Int.random(0 .. emptyCells.size - 1)];
            board.set(randomEmptyCell[0], randomEmptyCell[1], Int.random(1 .. 2) * 2);
        }
    }

    static Void squashBoardLeft(Board board) {
        for (i := 0; i < board.getRows(); ++i) {
            squashRowLeft(board, i);
        }
    }

    static Void squashBoardRight(Board board) {
        board.rotate(2);
        squashBoardLeft(board);
        board.rotate(-2);
    }

    static Void squashBoardUp(Board board) {
        board.rotate(-1);
        squashBoardLeft(board);
        board.rotate(1);
    }

    static Void squashBoardDown(Board board) {
        board.rotate(1);
        squashBoardLeft(board);
        board.rotate(-1);
    }

    private static Void squashRowLeft(Board board, Int row) {
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

    private static Int[][] collectEmptyCells(Board board) {
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
}
