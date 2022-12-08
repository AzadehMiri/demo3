package com.example.demo.entity;

public enum CustomerType {
    LEGAL_CUSTOMER(1,"Legal"),
    REAL_CUSTOMER(2,"Real");

    private final int type;
    private final String name;

    CustomerType(int type, String name) {
        this.type = type;
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public String getName() {
        return name;
    }
}
