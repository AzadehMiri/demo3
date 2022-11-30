package com.example.demo.repository;

import com.example.demo.entity.LegalCustomer;
import com.example.demo.entity.RealCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LegalCustomerRepository extends JpaRepository<LegalCustomer,Long> {

    @Query("SELECT r FROM LegalCustomer  r WHERE r.companyName " +
            "LIKE %?1% and r.economicCode like %?2% and r.customerNumber like %?3%")
    List<LegalCustomer> search(String companyName, String economicCode, String customerNumber);
}

