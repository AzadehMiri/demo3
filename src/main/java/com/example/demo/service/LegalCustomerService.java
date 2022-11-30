package com.example.demo.service;

import com.example.demo.entity.LegalCustomer;
import com.example.demo.repository.LegalCustomerRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
@AllArgsConstructor
public class LegalCustomerService {
    private final LegalCustomerRepository legalCustomerRepository;

    public String generateCustomerCode(String economicCode) {
        String yearString = economicCode.substring(0, 4);
        Random random = new Random();
        int x = random.nextInt(900) + 100;
        String s = String.valueOf(x);
        return s + yearString;
    }

    public LegalCustomer add(LegalCustomer legalCustomer) {
        String customerCode = generateCustomerCode(legalCustomer.getEconomicCode());
        //use Builder pattern
        legalCustomer = LegalCustomer.builder()
                .companyName(legalCustomer.getCompanyName())
                .registrationDate(legalCustomer.getRegistrationDate())
                .economicCode(legalCustomer.getEconomicCode())
                .customerNumber(customerCode)
                .build();
        return this.legalCustomerRepository.save(legalCustomer);
    }

    public LegalCustomer getLegalCustomerById(Long id) {
        return legalCustomerRepository.findById(id).orElse(null);
    }

    public List<LegalCustomer> findAllLegalCustomers() {
        return this.legalCustomerRepository.findAll();
    }

    public void delete(Long id) {
        legalCustomerRepository.deleteById(id);
    }

    public LegalCustomer updateLegalCustomer(Long id, LegalCustomer legalCustomer) {
        LegalCustomer existingLegalCustomer = legalCustomerRepository.findById(id).orElse(null);
        assert existingLegalCustomer != null;
        existingLegalCustomer.setCompanyName(Optional.ofNullable(legalCustomer.getCompanyName()).orElse(existingLegalCustomer.getCompanyName()));
        existingLegalCustomer.setEconomicCode(Optional.ofNullable(legalCustomer.getEconomicCode()).orElse(existingLegalCustomer.getEconomicCode()));
        existingLegalCustomer.setCustomerNumber(Optional.ofNullable(legalCustomer.getCustomerNumber()).orElse(existingLegalCustomer.getCustomerNumber()));
        return legalCustomerRepository.save(existingLegalCustomer);
    }

    public LegalCustomer findById(Long id) {
        return Optional.of(legalCustomerRepository.findById(id)).get().orElse(null);
    }

    public List<LegalCustomer> search(LegalCustomer legalCustomer) {
        return legalCustomerRepository.search(
                Optional.ofNullable(legalCustomer.getCompanyName()).orElse(""),
                Optional.ofNullable(legalCustomer.getEconomicCode()).orElse(""),
                Optional.ofNullable(legalCustomer.getCustomerNumber()).orElse("")
        );
    }
}
