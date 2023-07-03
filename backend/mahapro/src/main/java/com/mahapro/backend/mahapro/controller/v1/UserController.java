package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.service.UserService;
import com.mahapro.backend.mahapro.shared.exception.EmailNotVerified;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.html.parser.Entity;

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
    public ResponseEntity<String> registerUser(@RequestBody String jsonBody, @RequestHeader("Authorization") String authorizationheader) {
        try {
            User user = userService.save(jsonBody, authorizationheader);
            return ResponseEntity.ok(user.toString());

        } catch (Exception e) {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/verify")
    public ResponseEntity verifyUser(@RequestHeader("Authorization") String authorizationHeader) {
        try {
            userService.verify_user(authorizationHeader);

            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/login")
    public ResponseEntity<String> login(@RequestHeader("Authorization") String authorizationHeader) {
        try {
            User user = userService.login(authorizationHeader);
            if(!user.isEmailVerified()) {
                throw new EmailNotVerified();
            }
            return ResponseEntity.ok(user.toString());
        } catch (EmailNotVerified e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
