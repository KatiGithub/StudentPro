package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/user")
    public ResponseEntity addUserClick(
            @RequestHeader("Authorization") String authorizationHeader,
            @RequestParam("retailerId") int retailerId
    ) {
        try {
            businessService.addBusinessUserClick(authorizationHeader, retailerId);
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }
}
