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

    @GetMapping(value = "/")
    public String getLegalCustomer() {
        return "legal-customer-list";
    }

    @GetMapping(value = "/legal-customer-list")
    public String getLegalCustomer(ModelMap model) {
        List<LegalCustomer> legalCustomers = legalCustomerService.findAllLegalCustomers();
        model.put("legalCustomers", legalCustomers);
        return "legal-customer-list";
    }

    @GetMapping("/legal-customer-insert")
    public String insert(Map<String, Object> model) {
        model.put("legalCustomer", new LegalCustomer());
        return "insert-legal-customer";
    }

    @PostMapping("/legal-customer-add")
    public String create(@ModelAttribute("legalCustomer") LegalCustomer legalCustomer) throws InvalidNationalIDException {
        legalCustomerService.add(legalCustomer);
        return "redirect:legal-customer-list";
    }

    @GetMapping("/legal-customer-edit")
    public String edit(@RequestParam("id") String id, Map<String, Object> model) {
        LegalCustomer legalCustomer = legalCustomerService.findById(Long.parseLong(id));
        model.put("legalCustomer", legalCustomer);
        return "update-legal-customer";
    }

    @PostMapping("/legal-customer-update")
    public String update(@ModelAttribute("legalCustomer") LegalCustomer legalCustomer) {
        legalCustomerService.updateLegalCustomer(legalCustomer.getId(), legalCustomer);
        return "redirect:legal-customer-list";
    }

    @GetMapping("/legal-customer-delete")
    public String delete(@RequestParam("id") String id) {
        legalCustomerService.delete(Long.parseLong(id));
        return "redirect:legal-customer-list";
    }

    @PostMapping("/legal-customer-search")
    public String search(Model model, @ModelAttribute("legalCustomer") LegalCustomer legalCustomer) {
        List<LegalCustomer> legalCustomerSearchList = legalCustomerService.search(legalCustomer);
        model.addAttribute("legalCustomers", legalCustomerSearchList);
        return "legal-customer-list";
    }
}
