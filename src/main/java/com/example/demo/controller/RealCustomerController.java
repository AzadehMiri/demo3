package com.example.demo.controller;

import com.example.demo.entity.FacilityType;
import com.example.demo.entity.RealCustomer;
import com.example.demo.exception.InvalidNationalIDException;
import com.example.demo.service.FacilityTypeService;
import com.example.demo.service.RealCustomerService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/realCustomer")
@AllArgsConstructor
public class RealCustomerController {
    private RealCustomerService realCustomerService;
    private FacilityTypeService facilityTypeService;

    @GetMapping("/welcome")
    public String welcomePage() {
        return "welcome";
    }

    @GetMapping(value = "/")
    public String getRealCustomers() {
        return "real-customer-list";
    }

    @GetMapping(value = "/real-customer-list")
    public String getRealCustomers(ModelMap model) {
        List<RealCustomer> realCustomers = realCustomerService.findAllRealCustomers();
        model.put("realCustomers", realCustomers);
        return "real-customer-list";
    }

    @GetMapping("/real-customer-insert")
    public String insert(Map<String, Object> model) {
        model.put("realCustomer", new RealCustomer());
        return "insert-real-customer";
    }

    @PostMapping("/real-customer-add")
    public String createRealCustomer(@ModelAttribute("realCustomer") RealCustomer realCustomer) throws InvalidNationalIDException {
        realCustomerService.add(realCustomer);
        return "redirect:real-customer-list";
    }

    @GetMapping("/real-customer-edit")
    public String edit(@RequestParam("id") String id, Map<String, Object> model) {
        RealCustomer realCustomer = realCustomerService.findById(Long.parseLong(id));
        model.put("realCustomer", realCustomer);
        return "update-real-customer";
    }

    @PostMapping("/real-customer-update")
    public String update(@ModelAttribute("realCustomer") RealCustomer realCustomer) throws InvalidNationalIDException {
        realCustomerService.updateRealCustomer(realCustomer.getId(), realCustomer);
        return "redirect:real-customer-list";
    }

    @GetMapping("/real-customer-delete")
    public String delete(@RequestParam("id") String id) {
        realCustomerService.delete(Long.parseLong(id));
        return "redirect:real-customer-list";
    }

    @PostMapping("/real-customer-search")
    public String search(Model model, @ModelAttribute("realCustomer") RealCustomer realCustomer) {
        List<RealCustomer> realCustomerSearchList = realCustomerService.search(realCustomer);
        model.addAttribute("realCustomers", realCustomerSearchList);
        return "real-customer-list";
    }

    @GetMapping(value = "/get/{id}")
    public RealCustomer getFacility(@PathVariable Long id,
                                    @RequestParam Long facilityId,
                                    @RequestParam BigDecimal amount,
                                    @RequestParam Integer period) {
        return realCustomerService.getFacility(id, facilityId, amount, period);
    }

    @GetMapping(value = "/get-facility")
    public String getFacilityByCustomer(ModelMap model) {
        List<FacilityType> facilityTypeList = facilityTypeService.findAllFacilityTypes();
        model.put("facilityList", facilityTypeList);
        return "get-facility";
    }

    @PostMapping(value = "find-by-customer-number")
    public String getCustomerByCustomerNumber(ModelMap model, @ModelAttribute("customerNumber") String customerNumber) {
        RealCustomer realCustomer = realCustomerService.getCustomerByCustomerNumber(customerNumber);
        List<FacilityType> facilityTypeList = facilityTypeService.findAllFacilityTypes();
        model.put("realCustomer", realCustomer);
        model.put("facilityTypeList", facilityTypeList);
        return "get-facility";
    }

    @PostMapping(value = "get-facilityType-for-customer/{customerId}/{facilityId}/{contractAmount}/{contractPeriod}")
    public RealCustomer getFacilityForCustomer(@PathVariable Long customerId,
                                    @PathVariable Long facilityId,
                                    @PathVariable BigDecimal contractAmount,
                                    @PathVariable Integer contractPeriod) {
        return realCustomerService.getFacility(customerId, facilityId, contractAmount, contractPeriod);
    }
}
