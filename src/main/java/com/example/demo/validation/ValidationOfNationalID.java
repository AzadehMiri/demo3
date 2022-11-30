package com.example.demo.validation;

public class ValidationOfNationalID {
    public static boolean ValidationNationalID(String nationalId) {
        if (nationalId.isEmpty()) {
            return false;
        } else if (nationalId.length() != 10) {
            return false;
        } else {
            int sum = 0;
            for (int i = 0; i < 9; i++) {
                sum += Character.getNumericValue(nationalId.charAt(i)) * (10 - i);
            }
            int lastDigit;
            int divideRemaining = sum % 11;

            if (divideRemaining < 2) {
                lastDigit = divideRemaining;
            } else {
                lastDigit = 11 - (divideRemaining);
            }

            if (Character.getNumericValue(nationalId.charAt(9)) == lastDigit) {
                return true;
            } else {
                return false; // Invalid MelliCode
            }
        }
    }
}


