package com.mahapro.backend.mahapro.controller.v1.business_controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/business/user/")
public class BusinessUserController {
    public ResponseEntity<String> login() {
        return ResponseEntity.ok("");
    }
}
