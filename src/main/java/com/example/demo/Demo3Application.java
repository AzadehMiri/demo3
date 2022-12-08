package com.example.demo;

import com.example.demo.repository.RealCustomerRepository;
import com.example.demo.service.RealCustomerService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Demo3Application {

    public static void main(String[] args) {
        SpringApplication.run(Demo3Application.class, args);
        System.out.println("start");
    }

}
