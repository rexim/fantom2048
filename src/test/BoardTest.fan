
class BoardTest : Test {
    Void testToList() {
        board := Board.make(2, 2);
        board.set(0, 0, 1);
        board.set(0, 1, 2);
        board.set(1, 0, 3);
        board.set(1, 1, 4);
        verifyEq([[1, 2], [3, 4]], board.toList);
    }

    Void testRotate() {
        initialState := [[1, 2],
                         [3, 4],
                         [5, 6]];

        rotations := [1, -1, -1, 5, 4];

        expectedStates := [
            [[5, 3, 1],
             [6, 4, 2]],

            [[1, 2],
             [3, 4],
             [5, 6]],

            [[2, 4, 6],
             [1, 3, 5]],

            [[1, 2],
             [3, 4],
             [5, 6]],

            [[1, 2],
             [3, 4],
             [5, 6]]
        ];

        rotateAndCheck(initialState, rotations, expectedStates);
    }

    Void rotateAndCheck(Int[][] initialState, Int[] rotations, Int[][][] states) {
        board := makeBoardFromState(initialState);

        for (i := 0; i < rotations.size; ++i) {
            board.rotate(rotations[i]);
            verifyBoardState(states[i], board);
        }
    }

    Void verifyBoardState(Int[][] state, Board board) {
        verifyEq(state, takeStateFromBoard(board));
    }

    static Int[][] takeStateFromBoard(Board board) {
        state := Int[][,];
        for (i := 0; i < board.getRows; ++i) {
            row := Int[,];
            for (j := 0; j < board.getColumns; ++j) {
                row.push(board.get(i, j));
            }
            state.push(row);
        }
        return state;
    }

    static Board makeBoardFromState(Int[][] state) {
        board := Board.make(state.size, state[0].size);
        for (i := 0; i < state.size; ++i) {
            for (j := 0; j < state[i].size; ++j) {
                board.set(i, j, state[i][j]);
            }
        }
        return board;
    }
}
