package com.example.demo.controller;

import com.example.demo.entity.FacilityType;
import com.example.demo.service.FacilityTypeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
@RequestMapping("/facilityType")
public class FacilityTypeController {

private FacilityTypeService facilityTypeService;

    @GetMapping(value = "/facilityType-list")
    public String getFacilities(ModelMap model) {
        List<FacilityType> facilityTypes = facilityTypeService.findAllFacilityTypes();
        model.put("facilities", facilityTypes);
        return "facility-list";
    }

    @GetMapping("/facilityType-insert")
    public String insert(Map<String, Object> model) {
        model.put("facility", new FacilityType());
        return "insert-facility";
    }

    @PostMapping("/limitations-add")
    public String createFacility(@ModelAttribute("facilityType") FacilityType facilityType) {
        return "insert-limitation";
    }

    @PostMapping("/facilityType-add")
    public void insertFacility(@ModelAttribute("facilityType") FacilityType facilityType) {
        facilityTypeService.add(facilityType);
        System.out.println(facilityType);
    }
}
