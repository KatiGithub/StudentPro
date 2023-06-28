package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequestMapping(value = "/user", produces = MediaType.APPLICATION_JSON_VALUE)
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/{id}")
    public ResponseEntity<String> findUserById(@PathVariable("id") int id) {
        try {
            return ResponseEntity.ok(userService.findById(id).toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/register")
    public ResponseEntity registerUser(@RequestBody String jsonBody) {
        try {
            userService.save(jsonBody);
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/verify/{id}")
    public ResponseEntity verifyUser(@PathVariable("id") int userId) {
        try {
            userService.verify_user(userId);

            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

//    @GetMapping("/login")
//    public ResponseEntity login() {
//
//    }
}
