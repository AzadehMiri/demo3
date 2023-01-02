package com.example.demo.controller;

import com.example.demo.entity.Limitation;
import com.example.demo.service.LimitationService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/limitation")
@AllArgsConstructor
public class LimitationController {

    private LimitationService limitationService;

    @GetMapping(value = "/")
    public String getConditions() {
        return "limitation-list";
    }

    @PostMapping(value = "/update/{id}")
    public Limitation edit(@RequestBody Limitation limitation, @PathVariable Long id) {
        return limitationService.updateLimitation(id, limitation);
    }

    @GetMapping(value = "/delete/{id}")
    public void remove(@PathVariable Long id) {
        limitationService.delete(id);
    }

    @GetMapping(value = "/findById/{id}")
    public Limitation findById(@PathVariable Long id) {
        return limitationService.findById(id);
    }

    @GetMapping(value = "/findByFacilityId/{facilityId}")
    public List<Limitation> findByFacilityId(@PathVariable Long facilityId) {
        return limitationService.findByFacilityId(facilityId);
    }
}
