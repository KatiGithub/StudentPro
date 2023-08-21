package com.mahapro.backend.mahapro.controller.v1.business_controller;

import com.mahapro.backend.mahapro.model.BusinessUser;
import com.mahapro.backend.mahapro.service.business.BusinessUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/business/user/")
public class BusinessUserController {

    @Autowired
    BusinessUserService businessUserService;

    @GetMapping("/login")
    public ResponseEntity<String> login(@RequestHeader("Authorization") String authorizationHeader) {
        try {
            BusinessUser businessUser = businessUserService.login(authorizationHeader);
            return ResponseEntity.ok(businessUser.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/register")
    public ResponseEntity<String> registerUser() {
        return ResponseEntity.ok("");
    }

    @PostMapping("/add_user")
    public ResponseEntity addNewBusinessUser() {
        return new ResponseEntity(HttpStatus.OK);
    }

    @DeleteMapping("/{businessUserId}")
    public ResponseEntity deleteUserFromBusiness(@PathVariable String businessUserId) {
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping("/all/{id}")
    public ResponseEntity<String> getBusinessUsersFromBusiness(@PathVariable String id) {
        return ResponseEntity.ok("");
    }

    @GetMapping()
    public ResponseEntity<String> getBusinessUserFromCode(@RequestParam("code") String code) {
        return ResponseEntity.ok("");
    }
}
