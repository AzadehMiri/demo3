package com.example.demo.entity;

import javax.persistence.Entity;
import java.util.List;

@Entity
public class Facilities {
    private Long id;
    private String facilitiesName;
    private String interestRate;
    private List<Condition> conditions;
}
