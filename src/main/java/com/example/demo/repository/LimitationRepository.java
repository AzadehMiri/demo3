package com.example.demo.repository;

import com.example.demo.entity.Limitation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LimitationRepository extends JpaRepository<Limitation, Long> {
    List<Limitation> findByFacilityType_Id(Long facilityId);
}
