package com.mahapro.backend.mahapro.shared.utils;

import java.util.Random;

public class CouponCodeUtil {
    private static final String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String NUMBERS = "0123456789";

    public static String generateCouponCode() {
        StringBuilder couponCode = new StringBuilder();

        // Generate two random letters
        for (int i = 0; i < 2; i++) {
            int randomIndex = new Random().nextInt(LETTERS.length());
            char randomLetter = LETTERS.charAt(randomIndex);
            couponCode.append(randomLetter);
        }

        // Generate nine random numbers
        for (int i = 0; i < 9; i++) {
            int randomIndex = new Random().nextInt(NUMBERS.length());
            char randomNumber = NUMBERS.charAt(randomIndex);
            couponCode.append(randomNumber);
        }

        return couponCode.toString();
    }
}