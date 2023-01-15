package com.example.demo.repository;

import com.example.demo.entity.FacilityType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FacilityTypeRepository extends JpaRepository<FacilityType, Long> {
    @Query("select f from FacilityType f where f.name " +
            "LIKE %?1%  and f.interestRate LIKE %?2% ")
    List<FacilityType> searchAllBy(String name, String interestRate);

    FacilityType findByNameAndInterestRate(String name, String interestRate);

    boolean existsFacilityTypeByNameAndInterestRate(String name, String interestRate);
}
