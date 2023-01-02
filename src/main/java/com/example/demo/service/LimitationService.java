package com.example.demo.service;

import com.example.demo.entity.Limitation;
import com.example.demo.repository.LimitationRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class LimitationService {
    private final LimitationRepository limitationRepository;

    public void delete(Long id) {
        limitationRepository.deleteById(id);
    }

    public Limitation updateLimitation(Long id, Limitation limitation) {
        Limitation existingLimitation = limitationRepository.findById(id).orElse(null);
        assert existingLimitation != null;
        existingLimitation.setLimitationName(Optional.ofNullable(limitation.getLimitationName()).orElse(existingLimitation.getLimitationName()));
        existingLimitation.setMinimumContractPeriod(Optional.ofNullable(limitation.getMinimumContractPeriod()).orElse(existingLimitation.getMinimumContractPeriod()));
        existingLimitation.setMaximumContractPeriod(Optional.ofNullable(limitation.getMaximumContractPeriod()).orElse(existingLimitation.getMaximumContractPeriod()));
        existingLimitation.setMinimumContractAmount(Optional.ofNullable(limitation.getMinimumContractAmount()).orElse(existingLimitation.getMinimumContractAmount()));
        existingLimitation.setMaximumContractAmount(Optional.ofNullable(limitation.getMaximumContractAmount()).orElse(existingLimitation.getMaximumContractAmount()));
        return limitationRepository.save(existingLimitation);
    }

    public Limitation findById(Long id) {
        return Optional.of(limitationRepository.findById(id)).get().orElse(null);
    }

    public List<Limitation> findByFacilityId(Long facilityId) {
        return limitationRepository.findByFacilityType_Id(facilityId);
    }

}
