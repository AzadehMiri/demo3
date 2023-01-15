package com.example.demo.service;

import com.example.demo.entity.FacilityType;
import com.example.demo.entity.Limitation;
import com.example.demo.repository.FacilityTypeRepository;
import com.example.demo.repository.LimitationRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class FacilityTypeService {
    private final FacilityTypeRepository facilityTypeRepository;
    private final LimitationRepository limitationRepository;

    public boolean add(FacilityType facilityType) {
        FacilityType insertedFacilityType = new FacilityType();
        insertedFacilityType.setId(facilityTypeRepository.save(facilityType).getId());
        for (Limitation limitation : facilityType.getLimitations()) {
            limitation.setFacilityType(insertedFacilityType);
            limitationRepository.save(limitation);
        }
        return true;
    }

    public boolean update(Long id, FacilityType facilityType) {
        FacilityType existingFacilityType = facilityTypeRepository.findById(id).orElse(null);
        FacilityType facilityType1 = new FacilityType();
        facilityType1.setId(existingFacilityType.getId());
        for (Limitation limitation : facilityType.getLimitations()) {
            limitation.setFacilityType(facilityType1);
            limitationRepository.save(limitation);
        }
        return true;
    }

    public List<FacilityType> findAllFacilityTypes() {
        return this.facilityTypeRepository.findAll();
    }

    public void delete(Long id) {
        facilityTypeRepository.deleteById(id);
    }

    public FacilityType updateFacilityType(Long id, FacilityType facilityType) {
        FacilityType existingFacilityType = facilityTypeRepository.findById(id).orElse(null);
        assert existingFacilityType != null;
        existingFacilityType.setName(Optional.ofNullable(facilityType.getName()).orElse(existingFacilityType.getName()));
        existingFacilityType.setInterestRate(Optional.ofNullable(facilityType.getInterestRate()).orElse(existingFacilityType.getInterestRate()));
        return facilityTypeRepository.save(existingFacilityType);
    }

    public FacilityType findById(Long id) {
        return Optional.of(facilityTypeRepository.findById(id)).get().orElse(null);
    }

    public FacilityType findByNameAndInterestRate(String name, String interestRate) {
        FacilityType facilityType = facilityTypeRepository.findByNameAndInterestRate(name, interestRate);
        return facilityType;
    }

    public boolean existByNameAndInterestRate(String name, String interestRate) {
        return facilityTypeRepository.existsFacilityTypeByNameAndInterestRate(name, interestRate);
    }
}
