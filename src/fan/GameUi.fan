using fwt
using gfx

class GameUi: Canvas, IRenderer {
    override Void render(Int[][] board) {
        renderingBoard = board;
    }

    override Void onPaint(Graphics g) {
        super.onPaint(g);
        f := Font { it.name = Desktop.sysFont.name; it.size = 14 };
        g.font = f;

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
                        label := renderingBoard[i][j].toStr;
                        x := j * cellWidth + cellWidth / 2 - g.font.width(label) / 2;
                        y := i * cellHeight + cellHeight / 2 - g.font.height / 2;
                        g.drawText(label, x, y);
                    }
                }
            }
        }
    }

    IController? controller := null;
    private Int[][]? renderingBoard := null;
}
