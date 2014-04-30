
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
}
