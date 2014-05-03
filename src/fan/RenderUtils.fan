using gfx
using fwt

class RenderUtils {
    static Color cellColorByValue(Int value) {
        t := MathUtils.extractPowerOf2(value).min(5);
        return Color.makeRgb(50 * t, 110, 110);
    }

    static Void renderCell(Graphics g, Rect rect, Int value) {
        // background
        g.brush = cellColorByValue(value);
        g.fillRect(rect.x, rect.y, rect.w, rect.h);

        // label
        g.font = Font { it.name = Desktop.sysFont.name; it.size = 14 };
        g.brush = Color.white;

        label := value.toStr;
        labelX := rect.x + rect.w / 2 - g.font.width(label) / 2;
        labelY := rect.y + rect.h / 2 - g.font.height / 2;

        g.drawText(label, labelX, labelY);
    }
}
