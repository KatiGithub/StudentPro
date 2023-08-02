package com.mahapro.backend.mahapro.controller.v1.business_controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/business/user/")
public class BusinessUserController {

    @GetMapping("/login")
    public ResponseEntity<String> login() {
        return ResponseEntity.ok("");
    }

    @PostMapping("/register")
    public ResponseEntity<String> registerUser() {
        return ResponseEntity.ok("");
    }

    @PostMapping("/add_user")
    public ResponseEntity addNewBusinessUser() {
        return new ResponseEntity(HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteUserFromBusiness() {
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping("/all/{id}")
    public ResponseEntity<String> getBusinessUsersFromBusiness() {
        return ResponseEntity.ok("");
    }

    @GetMapping("/")
    public ResponseEntity<String> getBusinessUserFromCode(@RequestParam("code") String code) {
        return ResponseEntity.ok("");
    }
}
