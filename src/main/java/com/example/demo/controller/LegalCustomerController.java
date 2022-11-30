package com.example.demo.controller;

import com.example.demo.entity.LegalCustomer;
import com.example.demo.exception.InvalidNationalIDException;
import com.example.demo.service.LegalCustomerService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/legalCustomer")
@AllArgsConstructor
public class LegalCustomerController {
    private LegalCustomerService legalCustomerService;

    @GetMapping("/welcome")
    public String welcomePage() {
        return "welcome";
    }

    @GetMapping(value = "/list")
    public String getLegalCustomer(ModelMap model) {
        List<LegalCustomer> legalCustomers = legalCustomerService.findAllLegalCustomers();
        model.put("legalCustomers", legalCustomers);
        return "legal-customer-list";
    }

    @GetMapping("/insert")
    public String insert(Map<String, Object> model) {
        model.put("legalCustomer", new LegalCustomer());
        return "insert-or-update-legal-customer";
    }

    @PostMapping("/add")
    public String create(@ModelAttribute("legalCustomer") LegalCustomer legalCustomer) throws InvalidNationalIDException {
        legalCustomerService.add(legalCustomer);
        return "redirect:list";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") String id, Map<String, Object> model) {
        LegalCustomer legalCustomer = legalCustomerService.findById(Long.parseLong(id));
        model.put("legalCustomer", legalCustomer);
        return "insert-or-update-legal-customer";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("legalCustomer") LegalCustomer legalCustomer) {
        legalCustomerService.updateLegalCustomer(legalCustomer.getId(), legalCustomer);
        return "redirect:list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") String id) {
        legalCustomerService.delete(Long.parseLong(id));
        return "redirect:list";
    }

    @PostMapping("/search")
    public String search(Model model, @ModelAttribute("legalCustomer") LegalCustomer legalCustomer) {
        List<LegalCustomer> legalCustomerSearchList = legalCustomerService.search(legalCustomer);
        model.addAttribute("legalCustomers", legalCustomerSearchList);
        return "legal-customer-list";
    }
}
