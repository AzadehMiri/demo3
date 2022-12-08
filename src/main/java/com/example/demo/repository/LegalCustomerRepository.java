package com.example.demo.repository;

import com.example.demo.entity.CustomerType;
import com.example.demo.entity.LegalCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LegalCustomerRepository extends JpaRepository<LegalCustomer, Long> {

    @Query("SELECT r FROM LegalCustomer  r WHERE r.firstName " +
            "LIKE %?1% and r.nationalId like %?2% and r.customerNumber like %?3% and r.customerType = 'LEGAL_CUSTOMER'")
    List<LegalCustomer> search(String companyName, String economicCode, String customerNumber);
}

