
class MathUtils {
    static Int abs(Int x) {
        return x >= 0 ? x : -x;
    }

    static Int extractPowerOf2(Int x) {
        Int result := 0;

        while (x % 2 == 0) {
            ++result;
            x /= 2;
        }

        return result;
    }

    static Int min(Int x, Int y) {
        return x <= y ? x : y;
    }
}