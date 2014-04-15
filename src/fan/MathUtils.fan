
class MathUtils {
    static Int extractPowerOf2(Int x) {
        Int result := 0;

        while (x % 2 == 0) {
            ++result;
            x /= 2;
        }

        return result;
    }
}