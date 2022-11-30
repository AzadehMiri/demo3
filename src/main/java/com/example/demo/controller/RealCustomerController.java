package com.example.demo.controller;

import com.example.demo.entity.RealCustomer;
import com.example.demo.exception.InvalidNationalIDException;
import com.example.demo.service.RealCustomerService;
import com.example.demo.validation.ValidationOfNationalID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/realCustomer")
@AllArgsConstructor
public class RealCustomerController {
    private RealCustomerService realCustomerService;

    @GetMapping("/welcome")
    public String welcomePage() {
        return "welcome";
    }

    @GetMapping(value = "/list")
    public String getRealCustomers(ModelMap model) {
        List<RealCustomer> realCustomers = realCustomerService.findAllRealCustomers();
        model.put("realCustomers", realCustomers);
        return "real-customer-list";
    }

    @GetMapping("/insert")
    public String insert(Map<String, Object> model) {
        model.put("realCustomer", new RealCustomer());
        return "insert-or-update-real-customer";
    }

    @PostMapping("/add")
    public String createRealCustomer(@ModelAttribute("realCustomer") RealCustomer realCustomer) throws InvalidNationalIDException {
        realCustomerService.add(realCustomer);
        return "redirect:list";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") String id, Map<String, Object> model) {
        RealCustomer realCustomer = realCustomerService.findById(Long.parseLong(id));
        model.put("realCustomer", realCustomer);
        return "insert-or-update-real-customer";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("realCustomer") RealCustomer realCustomer) throws InvalidNationalIDException {
        realCustomerService.updateRealCustomer(realCustomer.getId(), realCustomer);
        return "redirect:list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") String id) {
        realCustomerService.delete(Long.parseLong(id));
        return "redirect:list";
    }

    @PostMapping("/search")
    public String search(Model model, @ModelAttribute("realCustomer") RealCustomer realCustomer) {
        List<RealCustomer> realCustomerSearchList = realCustomerService.search(realCustomer);
        model.addAttribute("realCustomers", realCustomerSearchList);
        return "real-customer-list";
    }
}
