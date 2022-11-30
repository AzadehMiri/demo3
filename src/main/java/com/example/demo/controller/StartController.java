package com.example.demo.controller;

import com.example.demo.entity.RealCustomer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class StartController {
    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }


    @GetMapping(value = "/list2")
    public String getRealCustomers(ModelMap model) {
        RealCustomer customer1 = RealCustomer.builder()
                .firstName("mehdi")
                .lastName("mirdar")
                .fatherName("mohammad")
                .nationalId("4830079258")
                .customerNumber("23409834")
                .birthDate("1372/10/01")
                .id(1L)
                .build();
        List<RealCustomer> customers = new ArrayList<>();
        customers.add(customer1);
        model.addAttribute("realCustomers", customers /*realCustomerService.findAllRealCustomers()*/);
        return "customer-list";
    }
}
