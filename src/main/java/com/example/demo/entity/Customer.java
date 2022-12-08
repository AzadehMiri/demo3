package com.example.demo.entity;

import lombok.*;

import javax.persistence.*;


@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String firstName;
    private String lastName;
    private String fatherName;
    private String birthDate;
    @Column(unique = true)
    private String nationalId;
    @Column(unique = true)
    private String customerNumber;
    @Enumerated(value = EnumType.STRING)
    @Column(name = "customer_type", nullable = false)
    private CustomerType customerType;
}
