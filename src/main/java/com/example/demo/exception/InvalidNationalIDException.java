package com.example.demo.exception;

public class InvalidNationalIDException extends Exception {
    public InvalidNationalIDException(String nationalIdentityNumber) {
        super(nationalIdentityNumber + " is invalid national identity number");
    }
}

