using gfx

class RenderUtilsTest : Test {
    Void testCellColorByValue() {
        testData := [
            [2,  Color.makeRgb(50,  110, 110)],
            [4,  Color.makeRgb(100, 110, 110)],
            [8,  Color.makeRgb(150, 110, 110)],
            [16, Color.makeRgb(200, 110, 110)],
            [32, Color.makeRgb(250, 110, 110)],
            [64, Color.makeRgb(250, 110, 110)]
        ];

        for (i := 0; i < testData.size; ++i) {
            verifyEq(testData[i][1],
                     RenderUtils.cellColorByValue(testData[i][0]));
        }
    }
}