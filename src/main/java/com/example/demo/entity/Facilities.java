package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Setter
@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Facilities {
    @Id
    @GeneratedValue
    private Long id;
    private String facilitiesName;
    private String interestRate;
    @OneToMany(mappedBy = "facilities")
    private List<Limitation> limitations;
}
