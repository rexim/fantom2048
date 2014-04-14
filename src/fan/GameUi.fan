using fwt
using gfx

class GameUi: Canvas, IRenderer {
    override Void render(Int[][] board) {
        renderingBoard = board;
    }

    override Void onPaint(Graphics g) {
        super.onPaint(g);
        drawGrid(g);
        drawCells(g);
    }

    private Void drawGrid(Graphics g) {
        if (renderingBoard != null) {
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
                        g.drawText(renderingBoard[i][j].toStr,
                                   j * cellWidth + cellWidth / 2,
                                   i * cellHeight + cellHeight / 2);
                    }
                }
            }
        }
    }

    IController? controller := null;
    private Int[][]? renderingBoard := null;
}
