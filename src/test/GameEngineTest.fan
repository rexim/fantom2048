
class GameEngineTest: Test {
    Void testInitialState() {
        gameEngine := GameEngine.make;
        mockRenderer := MockRenderer.make;
        gameEngine.renderer = mockRenderer;

        boardState := mockRenderer.renderingBoard;

        // Verifying size
        verifyEq(4, boardState.size);
        for (i := 0; i < 4; ++i) {
            verifyEq(4, boardState[i].size);
        }

        // Verifying content
        notEmptyCells := 0;
        for (i := 0; i < 4; ++i) {
            for (j := 0; j < 4; ++j) {
                verify([0, 2, 4].contains(boardState[i][j]));
                if (boardState[i][j] > 0) {
                    ++notEmptyCells;
                }
            }
        }
        verifyEq(2, notEmptyCells);
    }
}
