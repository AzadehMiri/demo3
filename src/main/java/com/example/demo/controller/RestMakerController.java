package com.example.demo.controller;

import com.example.demo.entity.FacilityType;
import com.example.demo.entity.RealCustomer;
import com.example.demo.service.FacilityTypeService;
import com.example.demo.service.RealCustomerService;
import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

@RestController
@RequestMapping("/test")
@AllArgsConstructor
public class RestMakerController {
    private RealCustomerService realCustomerService;
    private FacilityTypeService facilityTypeService;

    //content type application json
    @PostMapping(value = "get-facilityType-for-customer/{customerId}/{facilityId}/{contractAmount}/{contractPeriod}",
            produces = "application/json")
    public String getFacilityForCustomer(@PathVariable String customerId,
                                         @PathVariable Long facilityId,
                                         @PathVariable BigDecimal contractAmount,
                                         @PathVariable Integer contractPeriod) {

        boolean result = realCustomerService.takeFacility(customerId, facilityId, contractAmount, contractPeriod);
        Gson gson = new Gson();
        ResponseData res = new ResponseData();
        res.status = result;
        if (result) {
            res.data = "موفق";
        } else {
            res.data = "نا موفق";
        }
        return gson.toJson(res);
    }


    @PostMapping(value = "limitations-add/{facilityTypeName}/{facilityTypeInterestRate}", produces = "application/json")
    public String createFacility(@PathVariable String facilityTypeName,
                                 @PathVariable String facilityTypeInterestRate) {
        boolean result = facilityTypeService.existByNameAndInterestRate(facilityTypeName, facilityTypeInterestRate);
        Gson gson = new Gson();
        ResponseData res = new ResponseData();
        res.status = result;
        if (result) {
            res.data = "موجود";
        }
        return gson.toJson(res);
    }

    @PostMapping(value = "find-by-customer-number/{customerNumber}", produces = "application/json")
    public String getCustomerByCustomerNumber(@PathVariable("customerNumber") String customerNumber) {
        String result = realCustomerService.checkCustomerByCustomerNumber(customerNumber);
        Gson gson = new Gson();
        CustomerResponseData res = new CustomerResponseData();
        if (result.equals("موجود")) {
            RealCustomer realCustomer = realCustomerService.getCustomerByCustomerNumber(customerNumber);
            realCustomer.setFacilityList(null);
            realCustomer.setFacilityTypes(null);
            res.status = result;
            res.data = realCustomer;
        } else {
            res.status = result;
        }
        return gson.toJson(res);
    }

    @PostMapping(value = "/facilityType-add", produces = "application/json")
    public String insertFacility(@RequestBody FacilityType facilityType) {
        FacilityType facilityType1 = facilityTypeService.findByNameAndInterestRate(facilityType.getName(), facilityType.getInterestRate());
        boolean result;
        if (facilityType1 == null) {
            result = facilityTypeService.add(facilityType);
        } else {
            result = facilityTypeService.update(facilityType1.getId(), facilityType);
        }

        Gson gson = new Gson();
        ResponseData res = new ResponseData();
        res.status = result;
        if (result) {
            res.data = "عملیات موفق";
        }
        return gson.toJson(res);
    }

    class ResponseData {
        boolean status;
        String data;
    }

    class CustomerResponseData {
        String status;
        RealCustomer data;
    }
}
