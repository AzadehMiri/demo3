package com.example.demo.validation;

public class validationBirthDate {
    public static String birthDateFormat(String birthDate) {
       String year=birthDate.substring(0,3);
        String month = birthDate.substring(5, 7);
        String dat = birthDate.substring(8, 10);

        return year + "/" + month + "/" + dat;
    }
}
