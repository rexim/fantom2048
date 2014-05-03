using fwt
using gfx

class GameUi: Canvas, IRenderer {
    new make() {
        onKeyDown.add |e| {
            if (controller != null) {
                switch (e.key) {
                case Key.left:
                    controller.moveLeft;
                case Key.right:
                    controller.moveRight;
                case Key.up:
                    controller.moveUp;
                case Key.down:
                    controller.moveDown;
                }
            }
        };
    }

    override Void render(Int[][] board) {
        renderingBoard = board;
        repaint;
    }

    override Void onPaint(Graphics g) {
        super.onPaint(g);

        clearCanvas(g);
        drawCells(g);
        drawGrid(g);
    }

    private Void drawGrid(Graphics g) {
        if (renderingBoard != null) {
            g.brush = Color.black;
            rows := renderingBoard.size;
            columns := renderingBoard[0].size;
            cellWidth := size.w / columns;
            cellHeight := size.h / rows;

            for (i := 1; i < columns; ++i) {
                g.drawLine(i * cellWidth, 0,
                           i * cellWidth, size.h);
            }

            for (i := 1; i < rows; ++i) {
                g.drawLine(0, i * cellHeight,
                           size.w, i * cellHeight);
            }
       }
    }

    private Void drawCells(Graphics g) {
        if (renderingBoard != null) {
            rows := renderingBoard.size;
            columns := renderingBoard[0].size;
            cellWidth := size.w / columns;
            cellHeight := size.h / rows;

            for (i := 0; i < rows; ++i) {
                for (j := 0; j < columns; ++j) {
                    if (renderingBoard[i][j] != 0) {
                        RenderUtils.renderCell(g, Rect.make(j * cellWidth,
                                                            i * cellHeight,
                                                            cellWidth,
                                                            cellHeight),
                                               renderingBoard[i][j]);
                    }
                }
            }
        }
    }

    private Void clearCanvas(Graphics g) {
        g.brush = Color.white;
        g.fillRect(0, 0, size.w, size.h);
    }

    IController? controller := null;
    private Int[][]? renderingBoard := null;
}
