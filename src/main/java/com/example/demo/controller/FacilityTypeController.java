package com.example.demo.controller;

import com.example.demo.entity.FacilityType;
import com.example.demo.entity.Limitation;
import com.example.demo.service.FacilityTypeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
@RequestMapping("/facilityType")
public class FacilityTypeController {

    private FacilityTypeService facilityTypeService;

    @GetMapping("/facility-management")
    public String facilityManagementPage() {
        return "welcome";
    }

    @GetMapping(value = "/")
    public String getRealCustomers() {
        return "facility-management";
    }

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
    public String createFacility(@ModelAttribute("facilityType") FacilityType facilityType, Map<String, Object> model) {
        FacilityType facilityType1 = facilityTypeService.findByNameAndInterestRate(facilityType.getName(), facilityType.getInterestRate());
        if (facilityType1 == null) {
            facilityType1 = facilityType;
        } else {
            facilityType1.setFacilityList(null);
        }
        List<Limitation> limitationList = facilityType1.getLimitations();
        for (Limitation limitation : limitationList) {
            limitation.setFacilityType(null);
        }
        model.put("facilityType", facilityType);
        model.put("limitations", limitationList);
        return "insert-limitation";
    }

    @PostMapping("/limitations-add/{facilityTypeName}/{facilityTypeInterestRate}")
    public String createFacility(@PathVariable String facilityTypeName,
                                 @PathVariable String facilityTypeInterestRate,
                                 Map<String, Object> model) {
        FacilityType facilityTypeResult = new FacilityType();
        facilityTypeResult.setName(facilityTypeName);
        facilityTypeResult.setInterestRate(facilityTypeInterestRate);
        model.put("facilityType1", facilityTypeResult);
        return "insert-limitation";
    }

    @PostMapping("/facilityType-add")
    public String insertFacility(@RequestBody FacilityType facilityType) {
        FacilityType facilityType1 = facilityTypeService.findByNameAndInterestRate(facilityType.getName(), facilityType.getInterestRate());
        if (facilityType1 == null) {
            facilityTypeService.add(facilityType);
        } else {
            facilityTypeService.update(facilityType1.getId(), facilityType);
        }
        return "redirect:insert-facility";
    }
}
