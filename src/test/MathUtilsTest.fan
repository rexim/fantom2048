
class MathUtilsTest: Test {
    Void testExtractPowerOf2() {
        testData := [
            [2,    1],
            [4,    2],
            [8,    3],
            [16,   4],
            [32,   5],
            [64,   6],
            [128,  7],
            [256,  8],
            [512,  9],
            [1024, 10]
        ];

        for (i := 0; i < testData.size; ++i) {
            verifyEq(testData[i][1],
                     MathUtils.extractPowerOf2(testData[i][0]),
                     "Input: ${testData[i][0]}");
        }
    }
}
