
class GameEngine: IController {
    new make() {
        BoardUtils.addRandomValue(board);
        BoardUtils.addRandomValue(board);
    }

    override Void moveLeft() {
        BoardUtils.squashBoardLeft(board);
        BoardUtils.addRandomValue(board);
        if (renderer != null) {
            renderer.render(board.toList);
        }

    }

    override Void moveRight() {
        BoardUtils.squashBoardRight(board);
        BoardUtils.addRandomValue(board);
        if (renderer != null) {
            renderer.render(board.toList);
        }
    }

    override Void moveUp() {
        BoardUtils.squashBoardUp(board);
        BoardUtils.addRandomValue(board);
        if (renderer != null) {
            renderer.render(board.toList);
        }
    }

    override Void moveDown() {
        BoardUtils.squashBoardDown(board);
        BoardUtils.addRandomValue(board);
        if (renderer != null) {
            renderer.render(board.toList);
        }
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
