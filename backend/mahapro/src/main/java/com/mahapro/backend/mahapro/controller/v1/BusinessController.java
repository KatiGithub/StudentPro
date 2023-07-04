package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/retailer", produces = MediaType.APPLICATION_JSON_VALUE)
public class BusinessController {

    @Autowired
    BusinessService businessService;

    @GetMapping("/random")
    public ResponseEntity<String> getBusinessByRandom() {
        try {
            return ResponseEntity.ok(businessService.findBusinessByRandom().toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
