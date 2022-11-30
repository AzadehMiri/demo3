package com.example.demo.entity;


import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RealCustomer {
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
}