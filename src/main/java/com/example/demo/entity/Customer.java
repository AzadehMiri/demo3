package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import javax.persistence.*;
import java.util.List;


@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Customer {
    @Id
    @GeneratedValue
    private Long id;
    private String firstName;
    private String lastName;
    private String fatherName;
    private String birthDate;
    @Column(unique = true, length = 10)
    private String nationalId;
    @Column(unique = true)
    private String customerNumber;
    @Enumerated(value = EnumType.STRING)
    @Column(name = "customer_type", nullable = false)
    private CustomerType customerType;

    @ManyToMany
    @JoinTable(name = "customer_facilityTypes")
    private List<FacilityType> facilityTypes;
    @OneToMany(mappedBy = "customer")
    private List<Facility> facilityList;
}
