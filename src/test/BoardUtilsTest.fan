
class BoardUtilsTest: Test {
    Void testAddRandomValue() {
        n := 4;
        m := 4;
        allowedValues := [0, 2, 4];
        board := Board.make(n, m);
        BoardUtils.addRandomValue(board);
        notEmptyCells := 0;
        for (i := 0; i < n; ++i) {
            for (j := 0; j < m; ++j) {
                verify(allowedValues.contains(board.get(i, j)));
                if (board.get(i, j) > 0) {
                    ++notEmptyCells;
                }
            }
        }
        verifyEq(1, notEmptyCells);
    }

    Void testSquashes() {
        testFunctions := [
            BoardUtils#squashBoardLeft.func,
            BoardUtils#squashBoardRight.func,
            BoardUtils#squashBoardUp.func,
            BoardUtils#squashBoardDown.func
        ];

        testData := [
            [
                [[2, 2],
                 [2, 4]],

                [[4, 0],
                 [2, 4]]
            ],

            [
                [[2, 2],
                 [2, 4]],

                [[0, 4],
                 [2, 4]]
            ],

            [
                [[2, 2],
                 [2, 4]],

                [[4, 2],
                 [0, 4]],
            ],

            [
                [[2, 2],
                 [2, 4]],

                [[0, 2],
                 [4, 4]]
            ],
        ];

        for (i := 0; i < testFunctions.size; ++i) {
            board := BoardTest.makeBoardFromState(testData[i][0]);
            testFunctions[i](board);
            verifyEq(testData[i][1], BoardTest.takeStateFromBoard(board));
        }
    }
}
