package com.example.demo.service;

import com.example.demo.entity.Facility;
import com.example.demo.entity.FacilityType;
import com.example.demo.repository.FacilityRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class FacilityService {
    private FacilityRepository facilityRepository;

    public Facility add(Facility facility) {
        return facilityRepository.save(facility);
    }

    public List<Facility> findAllFacilities() {
        return facilityRepository.findAll();
    }

    public void delete(Long id) {
        facilityRepository.deleteById(id);
    }

    public Facility updateFacility(Long id, Facility facility) {
        Facility existingFacility = facilityRepository.findById(id).orElse(null);
        assert existingFacility != null;
        existingFacility.setAmount(Optional.ofNullable(facility.getAmount()).orElse(existingFacility.getAmount()));
        existingFacility.setPeriod(Optional.ofNullable(facility.getPeriod()).orElse(existingFacility.getPeriod()));
        return facilityRepository.save(existingFacility);
    }

    public Facility findById(Long id) {
        return Optional.of(facilityRepository.findById(id)).get().orElse(null);
    }
}
