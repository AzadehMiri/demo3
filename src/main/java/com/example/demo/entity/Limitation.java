package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Limitation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String limitationName;
    private Integer minimumContractPeriod;
    private Integer maximumContractPeriod;
    private BigDecimal minimumContractAmount;
    private BigDecimal maximumContractAmount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "facilityType_id")
    @JsonIgnore
    private FacilityType facilityType;
}
