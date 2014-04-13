
class MockRenderer: IRenderer {
    override Void render(Int[][] board) {
        renderingBoard = board;
    }

    Int[][] renderingBoard := Int[][,];
}