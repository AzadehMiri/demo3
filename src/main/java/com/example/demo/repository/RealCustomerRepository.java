package com.example.demo.repository;

import com.example.demo.entity.RealCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RealCustomerRepository  extends JpaRepository<RealCustomer,Long> {

    @Query("SELECT r FROM RealCustomer r WHERE r.firstName " +
            "LIKE %?1% and r.lastName like %?2% and r.customerNumber like %?3% and r.nationalId like %?4%")
    List<RealCustomer> search(String firstName, String lastName, String customerNumber, String nationalId);
}
