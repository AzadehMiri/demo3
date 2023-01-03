package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Setter
@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class FacilityType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String interestRate;
    @OneToMany(mappedBy = "facilityType",
            cascade = CascadeType.ALL)
    private List<Limitation> limitations = new ArrayList<>();

    @ManyToMany(mappedBy = "facilityTypes")
    private List<Customer> customers;

    @OneToMany(mappedBy = "facilityType")
    private List<Facility> facilityList;
}
