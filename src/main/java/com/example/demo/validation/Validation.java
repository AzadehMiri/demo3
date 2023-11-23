package com.example.demo.validation;

import com.example.demo.entity.Limitation;

import java.math.BigDecimal;
import java.util.List;

public class Validation {
    public static boolean ValidationNationalID(String nationalId) {
        if (nationalId.length() == 10) {
            Character.getNumericValue(nationalId.charAt(9));
            getLastDigit(nationalId);
        }
        return true;
    }

    private static int getLastDigit(String nationalId) {
        int sum = 0;
        for (int i = 0; i < 9; i++) {
            sum += Character.getNumericValue(nationalId.charAt(i)) * (10 - i);
        }
        int divideRemaining = sum % 11;
        return (divideRemaining < 2 ? divideRemaining : 11 - divideRemaining);
    }

    public static boolean getFacilityTypeValidation(List<Limitation> limitations, BigDecimal amount, int period) {
        for (Limitation limitation : limitations) {
            if (amount.compareTo(limitation.getMaximumContractAmount()) < 1
                    && amount.compareTo(limitation.getMinimumContractAmount()) > -1
                    && period <= limitation.getMaximumContractPeriod()
                    && period >= limitation.getMinimumContractPeriod()) {
                return true;
            }
        }
        return false;
    }
}


