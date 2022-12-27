package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import javax.persistence.*;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Limitation {
    @Id
    @GeneratedValue
    private Long id;
    private String limitationName;
    private String MinimumContractPeriod;
    private String MaximumContractPeriod;
    private String MinimumContractAmount;
    private String MaximumContractAmount;

    @ManyToOne
    @JoinColumn(name = "facilities_id")
    private Facilities facilities;
}
