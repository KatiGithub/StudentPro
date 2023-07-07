package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.service.TransactionService;
import com.mahapro.backend.mahapro.shared.exception.LimitReachedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/transaction", produces = MediaType.APPLICATION_JSON_VALUE)
public class TransactionController {

    @Autowired
    TransactionService transactionService;

    @GetMapping("/user/{id}")
    public ResponseEntity<String> findByUserId(@PathVariable("id") int userId) {
        return ResponseEntity.ok(transactionService.findByUserId(userId).toString());
    }

    @PostMapping("/claim/{id}")
    public ResponseEntity<String> claimCoupon(
            @PathVariable("id") int discountId,
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        try {
            return ResponseEntity.ok(transactionService.claimCoupon(discountId, authorizationHeader).toString());
        } catch (LimitReachedException e) {
            return new ResponseEntity(HttpStatus.UNAUTHORIZED);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/discount/{id}")
    public ResponseEntity checkUseLimit(
            @PathVariable("id") int discountId,
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        try {
            transactionService.checkUserLimit(discountId, authorizationHeader);

            return ResponseEntity.ok().build();
        } catch (LimitReachedException e) {
            return new ResponseEntity(HttpStatus.UNAUTHORIZED);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}
