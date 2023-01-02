package com.example.demo.controller;

import com.example.demo.entity.FacilityType;
import com.example.demo.service.FacilityTypeService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
public class testController {
    private FacilityTypeService facilityTypeService;

    @GetMapping(value = {"/", ""})
    public List<FacilityType> getFacilities() {
        return facilityTypeService.findAllFacilityTypes();
    }

    @PostMapping(value = {"/", ""})
    public FacilityType add(@RequestBody FacilityType facilityType) {
        return facilityTypeService.add(facilityType);
    }

    @GetMapping(value = "/delete/{id}")
    public void remove(@PathVariable Long id) {
        facilityTypeService.delete(id);
    }

    @PostMapping(value = "/update/{id}")
    public FacilityType edit(@RequestBody FacilityType facilityType, @PathVariable Long id) {
        return facilityTypeService.updateFacilityType(id, facilityType);
    }

    @GetMapping(value = "/findById/{id}")
    public FacilityType findById(@PathVariable Long id) {
        return facilityTypeService.findById(id);
    }
}
