package com.example.demo.service;

import com.example.demo.entity.*;
import com.example.demo.exception.InvalidNationalIDException;
import com.example.demo.repository.LegalCustomerRepository;
import com.example.demo.repository.LimitationRepository;
import com.example.demo.repository.RealCustomerRepository;
import com.example.demo.validation.Validation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
@AllArgsConstructor
public class RealCustomerService {
    private final RealCustomerRepository realCustomerRepository;
    private final LegalCustomerRepository legalCustomerRepository;
    private final LimitationRepository limitationRepository;

    private FacilityService facilityService;

    public String generateCustomerCode(String birthDate, String nationalId) {
        String yearString = birthDate.substring(0, 3);
        String id = nationalId.substring(0, 4);
        Random random = new Random();
        int x = random.nextInt(900) + 100;
        String s = String.valueOf(x);
        return s + id + yearString;
    }

    public RealCustomer add(RealCustomer realCustomer) throws InvalidNationalIDException {
        if (!Validation.ValidationNationalID(realCustomer.getNationalId())) {
            throw new InvalidNationalIDException(realCustomer.getNationalId());
        }
        String customerCode = generateCustomerCode(realCustomer.getBirthDate(), realCustomer.getNationalId());
        realCustomer.setFirstName(realCustomer.getFirstName());
        realCustomer.setLastName(realCustomer.getLastName());
        realCustomer.setFatherName(realCustomer.getFatherName());
        realCustomer.setBirthDate(realCustomer.getBirthDate());
        realCustomer.setCustomerNumber(customerCode);
        realCustomer.setNationalId(realCustomer.getNationalId());
        realCustomer.setCustomerType(CustomerType.REAL_CUSTOMER);
        return this.realCustomerRepository.save(realCustomer);
    }

    public RealCustomer getRealCustomerById(Long id) {
        return realCustomerRepository.findById(id).orElse(null);
    }

    public List<RealCustomer> findAllRealCustomers() {
        return this.realCustomerRepository.findAll();
    }

    public void delete(Long id) {
        realCustomerRepository.deleteById(id);
    }

    public RealCustomer updateRealCustomer(Long id, RealCustomer realCustomer) throws InvalidNationalIDException {
        if (!Validation.ValidationNationalID(realCustomer.getNationalId())) {
            throw new InvalidNationalIDException(realCustomer.getNationalId());
        }
        RealCustomer existingRealCustomer = realCustomerRepository.findById(id).orElse(null);
        assert existingRealCustomer != null;
        existingRealCustomer.setFirstName(Optional.ofNullable(realCustomer.getFirstName()).orElse(existingRealCustomer.getFirstName()));
        existingRealCustomer.setLastName(Optional.ofNullable(realCustomer.getLastName()).orElse(existingRealCustomer.getLastName()));
        existingRealCustomer.setFatherName(Optional.ofNullable(realCustomer.getFatherName()).orElse(existingRealCustomer.getFatherName()));
        existingRealCustomer.setBirthDate(Optional.ofNullable(realCustomer.getBirthDate()).orElse(existingRealCustomer.getBirthDate()));
        existingRealCustomer.setNationalId(Optional.ofNullable(realCustomer.getNationalId()).orElse(existingRealCustomer.getNationalId()));

        return realCustomerRepository.save(existingRealCustomer);
    }

    public RealCustomer findById(Long id) {
        return Optional.of(realCustomerRepository.findById(id)).get().orElse(null);
    }

    public RealCustomer findByCustomerNumber(String customerNumber) {
        return Optional.of(realCustomerRepository.findRealCustomerByCustomerNumber(customerNumber)).get();
    }

    public List<RealCustomer> search(RealCustomer realCustomer) {
        return realCustomerRepository.search(
                Optional.ofNullable(realCustomer.getFirstName()).orElse(""),
                Optional.ofNullable(realCustomer.getLastName()).orElse(""),
                Optional.ofNullable(realCustomer.getCustomerNumber()).orElse(""),
                Optional.ofNullable(realCustomer.getNationalId()).orElse("")
        );
    }

    public RealCustomer getFacility(String customerId, Long facilityTypeId, BigDecimal amount, Integer period) {
        RealCustomer customer = findByCustomerNumber(customerId);
        List<Limitation> limitations = limitationRepository.findByFacilityType_Id(facilityTypeId);
        boolean canGetFacility = Validation.getFacilityTypeValidation(limitations, amount, period);
        if (canGetFacility) {
            FacilityType facilityType = new FacilityType();
            facilityType.setId(facilityTypeId);
            List<FacilityType> facilityTypeList = new ArrayList<>();
            facilityTypeList.add(facilityType);
            customer.setFacilityTypes(facilityTypeList);
            Facility facility = Facility.builder()
                    .amount(amount)
                    .period(period)
                    .customer(customer)
                    .facilityType(facilityType)
                    .build();
            facilityService.add(facility);
        }

        return realCustomerRepository.save(customer);
    }

    public boolean takeFacility(String customerId, Long facilityTypeId, BigDecimal amount, Integer period) {
        RealCustomer customer = findByCustomerNumber(customerId);
        List<Limitation> limitations = limitationRepository.findByFacilityType_Id(facilityTypeId);
        boolean canGetFacility = Validation.getFacilityTypeValidation(limitations, amount, period);
        if (canGetFacility) {
            FacilityType facilityType = new FacilityType();
            facilityType.setId(facilityTypeId);
            List<FacilityType> facilityTypeList = new ArrayList<>();
            facilityTypeList.add(facilityType);
            customer.setFacilityTypes(facilityTypeList);
            Facility facility = Facility.builder()
                    .amount(amount)
                    .period(period)
                    .customer(customer)
                    .facilityType(facilityType)
                    .build();
            facilityService.add(facility);
            realCustomerRepository.save(customer);
            return true;
        }

        return false;
    }

    public String checkCustomerByCustomerNumber(String customerNumber) {
        RealCustomer realCustomer = realCustomerRepository.findRealCustomerByCustomerNumber(customerNumber);
        if (realCustomer == null) {
            LegalCustomer legalCustomer = legalCustomerRepository.findLegalCustomerByCustomerNumber(customerNumber);
            if (legalCustomer != null) {
                return "تسهیلات به مشتری حقوقی تعلق نمی گیرد";
            } else {
                return "شماره مشتری ناموجود";
            }
        }
        return "موجود";
    }

    public RealCustomer getCustomerByCustomerNumber(String customerNumber) {
        RealCustomer realCustomer = realCustomerRepository.findRealCustomerByCustomerNumber(customerNumber);
        return realCustomer;
    }
}

