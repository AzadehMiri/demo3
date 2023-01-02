package com.example.demo.service;

import com.example.demo.entity.FacilityType;
import com.example.demo.entity.Limitation;
import com.example.demo.repository.FacilityTypeRepository;
import com.example.demo.repository.LimitationRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class FacilityTypeService {
    private final FacilityTypeRepository facilityTypeRepository;
    private final LimitationRepository limitationRepository;

    public FacilityType add(FacilityType facilityType) {
        FacilityType insertedFacilityType = facilityTypeRepository.save(facilityType);
        List<Limitation> limitations = new ArrayList<>();
        for (Limitation limitation : facilityType.getLimitations()) {
            limitation.setFacilityType(insertedFacilityType);
            Limitation insertedLimitation = limitationRepository.save(limitation);
            limitations.add(insertedLimitation);
        }
        insertedFacilityType.setLimitations(limitations);
        return insertedFacilityType;
    }

    public List<FacilityType> findAllFacilityTypes() {
        return this.facilityTypeRepository.findAll();
    }

    public void delete(Long id) {
        facilityTypeRepository.deleteById(id);
    }

    public FacilityType updateFacilityType(Long id, FacilityType facilityType) {
        FacilityType existingFacilityType = facilityTypeRepository.findById(id).orElse(null);
        //  Limitation existingLimitation = limitationRepository.findById(id).orElse(null);
        assert existingFacilityType != null;
        // assert existingLimitation != null;
        existingFacilityType.setName(Optional.ofNullable(facilityType.getName()).orElse(existingFacilityType.getName()));
        existingFacilityType.setInterestRate(Optional.ofNullable(facilityType.getInterestRate()).orElse(existingFacilityType.getInterestRate()));
        /*List<Limitation> limitationList = new ArrayList<>();
        for (Limitation limitation : facility.getLimitations()) {
            limitation.setLimitationName(Optional.ofNullable(limitation.getLimitationName()).orElse(existingLimitation.getLimitationName()));
            limitation.setMinimumContractPeriod(Optional.ofNullable(limitation.getMinimumContractPeriod()).orElse(existingLimitation.getMinimumContractPeriod()));
            limitation.setMinimumContractPeriod(Optional.ofNullable(limitation.getMaximumContractPeriod()).orElse(existingLimitation.getMaximumContractPeriod()));
            limitation.setMinimumContractAmount(Optional.ofNullable(limitation.getMinimumContractAmount()).orElse(existingLimitation.getMinimumContractAmount()));
            limitation.setMaximumContractAmount(Optional.ofNullable(limitation.getMaximumContractAmount()).orElse(existingLimitation.getMaximumContractAmount()));
            limitationList.add(limitation);
        }
        existingFacility.setLimitations(limitationList);*/
        return facilityTypeRepository.save(existingFacilityType);
    }
    public FacilityType findById(Long id) {
        return Optional.of(facilityTypeRepository.findById(id)).get().orElse(null);
    }
}
