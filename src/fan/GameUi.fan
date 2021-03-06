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

        g.brush = Color.white;
        g.fillRect(0, 0, size.w, size.h);

        f := Font { it.name = Desktop.sysFont.name; it.size = 14 };
        g.font = f;

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
                        // drawing cell's background
                        t := MathUtils.extractPowerOf2(renderingBoard[i][j]).min(5);
                        g.brush = Color.makeRgb(50 * t, 110, 110);
                        g.fillRect(j * cellWidth, i * cellHeight,
                                   cellWidth, cellHeight);

                        // drawing label
                        g.brush = Color.white;
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
