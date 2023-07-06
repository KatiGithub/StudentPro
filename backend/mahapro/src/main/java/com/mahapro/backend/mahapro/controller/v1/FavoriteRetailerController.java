package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.service.FavoriteRetailerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/favorite", produces = MediaType.APPLICATION_JSON_VALUE)
public class FavoriteRetailerController {

    @Autowired
    FavoriteRetailerService favoriteRetailerService;

    @GetMapping("/retailer")
    public ResponseEntity<String> getFavoriteRetailerByUserId(
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        try {
            return ResponseEntity.ok(favoriteRetailerService.findByUserId(authorizationHeader).toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

//    @PostMapping("/retailer")
//    public ResponseEntity insertFavoriteRetailerByUserId(
//            @RequestHeader("Authorization") String authorizationHeader,
//            @RequestParam("businessId") int businessId
//    ) {
//
//    }
}
