
class GameEngine: IController {
    new make() {
        BoardUtils.addRandomValue(board);
        BoardUtils.addRandomValue(board);
    }

    override Void moveLeft() {
        prevBoardState := board.toList
        BoardUtils.squashBoardLeft(board);
        if (prevBoardState != board.toList) {
            BoardUtils.addRandomValue(board);
        }
        if (renderer != null) {
            renderer.render(board.toList);
        }

    }

    override Void moveRight() {
        prevBoardState := board.toList
        BoardUtils.squashBoardRight(board);
        if (prevBoardState != board.toList) {
            BoardUtils.addRandomValue(board);
        }
        if (renderer != null) {
            renderer.render(board.toList);
        }
    }

    override Void moveUp() {
        prevBoardState := board.toList
        BoardUtils.squashBoardUp(board);
        if (prevBoardState != board.toList) {
            BoardUtils.addRandomValue(board);
        }
        if (renderer != null) {
            renderer.render(board.toList);
        }
    }

    override Void moveDown() {
        prevBoardState := board.toList
        BoardUtils.squashBoardDown(board);
        if (prevBoardState != board.toList) {
            BoardUtils.addRandomValue(board);
        }
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
