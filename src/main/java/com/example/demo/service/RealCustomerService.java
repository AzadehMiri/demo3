package com.example.demo.service;

import com.example.demo.entity.RealCustomer;
import com.example.demo.exception.InvalidNationalIDException;
import com.example.demo.repository.RealCustomerRepository;
import com.example.demo.validation.ValidationOfNationalID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
@AllArgsConstructor
public class RealCustomerService {
    private final RealCustomerRepository realCustomerRepository;

    public String generateCustomerCode(String birthDate, String nationalId) {
        String yearString = birthDate.substring(0, 3);
        String id = nationalId.substring(0, 4);
        Random random = new Random();
        int x = random.nextInt(900) + 100;
        String s = String.valueOf(x);
        return s + id + yearString;
    }

    public RealCustomer add(RealCustomer realCustomer) throws InvalidNationalIDException {
        String customerCode = generateCustomerCode(realCustomer.getBirthDate(), realCustomer.getNationalId());
        //use Builder pattern
        realCustomer = RealCustomer.builder()
                .firstName(realCustomer.getFirstName())
                .lastName(realCustomer.getLastName())
                .fatherName(realCustomer.getFatherName())
                .birthDate(realCustomer.getBirthDate())
                .nationalId(realCustomer.getNationalId())
                .customerNumber(customerCode)
                .build();
        if (!ValidationOfNationalID.ValidationNationalID(realCustomer.getNationalId())) {
            throw new InvalidNationalIDException(realCustomer.getNationalId());
        }
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
        RealCustomer existingRealCustomer = realCustomerRepository.findById(id).orElse(null);
        assert existingRealCustomer != null;
        existingRealCustomer.setFirstName(Optional.ofNullable(realCustomer.getFirstName()).orElse(existingRealCustomer.getFirstName()));
        existingRealCustomer.setLastName(Optional.ofNullable(realCustomer.getLastName()).orElse(existingRealCustomer.getLastName()));
        existingRealCustomer.setFatherName(Optional.ofNullable(realCustomer.getFatherName()).orElse(existingRealCustomer.getFatherName()));
        existingRealCustomer.setBirthDate(Optional.ofNullable(realCustomer.getBirthDate()).orElse(existingRealCustomer.getBirthDate()));
        existingRealCustomer.setNationalId(Optional.ofNullable(realCustomer.getNationalId()).orElse(existingRealCustomer.getNationalId()));
        if (!ValidationOfNationalID.ValidationNationalID(realCustomer.getNationalId())) {
            throw new InvalidNationalIDException(realCustomer.getNationalId());
        }
        return realCustomerRepository.save(existingRealCustomer);
    }

    public RealCustomer findById(Long id) {
        return Optional.of(realCustomerRepository.findById(id)).get().orElse(null);
    }

    public List<RealCustomer> search(RealCustomer realCustomer) {
        return realCustomerRepository.search(
                Optional.ofNullable(realCustomer.getFirstName()).orElse(""),
                Optional.ofNullable(realCustomer.getLastName()).orElse(""),
                Optional.ofNullable(realCustomer.getCustomerNumber()).orElse(""),
                Optional.ofNullable(realCustomer.getNationalId()).orElse("")
        );
    }
}

