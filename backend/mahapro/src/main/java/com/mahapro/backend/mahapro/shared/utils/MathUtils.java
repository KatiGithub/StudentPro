package com.mahapro.backend.mahapro.shared.utils;

public class MathUtils {
    public static int findMaxDivision(int dividend, int divisor) {
        if (dividend < divisor) {
            return 0;
        } else {
            return 1 + findMaxDivision(dividend / divisor, divisor);
        }
    }
}