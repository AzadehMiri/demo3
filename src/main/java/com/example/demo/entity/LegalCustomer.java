package com.example.demo.entity;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LegalCustomer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String companyName;
    @CreationTimestamp
    private LocalDateTime registrationDate;
    @Column(unique = true)
    private String economicCode;
    @Column(unique = true)
    private String customerNumber;

    public LegalCustomer(Long id, String companyName, String economicCode, String customerNumber) {
        this.id = id;
        this.companyName = companyName;
        this.economicCode = economicCode;
        this.customerNumber = customerNumber;
    }
}
