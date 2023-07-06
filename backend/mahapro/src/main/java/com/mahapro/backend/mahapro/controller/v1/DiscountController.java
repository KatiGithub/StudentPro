package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.model.Business.Discount.Discount;
import com.mahapro.backend.mahapro.service.DiscountService;
import com.mahapro.backend.mahapro.shared.enums.DiscountSortingMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

@Controller
@ApiController
@RequestMapping(value = "/discount", produces = MediaType.APPLICATION_JSON_VALUE)
public class DiscountController {

    @Autowired
    private DiscountService discountService;

    @GetMapping("/")
    public ResponseEntity<String> getDiscounts(
            @RequestParam("sort") String sortingMethod,
            @RequestParam("longitude") @Nullable Double longitude,
            @RequestParam("latitude") @Nullable Double latitude
    ) {
        try {
            if(sortingMethod.equals("location")) {
                if(longitude == null || latitude == null) {
                    return ResponseEntity.badRequest().build();
                }

                return ResponseEntity.ok(discountService.findByLocation(longitude, latitude).toString());
            } else if(sortingMethod.equals("random")) {
                return ResponseEntity.ok(discountService.findByRandom().toString());
            } else {
                return ResponseEntity.badRequest().build();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());

            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<String> getDiscountById(@PathVariable("id") int id) {
        return ResponseEntity.ok(discountService.findById(id).toString());
    }

    @GetMapping("/business/{id}")
    public ResponseEntity<String> getDiscountByBusinessId(@PathVariable("id") int businessId) {
        return ResponseEntity.ok(discountService.findByBusinessId(businessId).toString());
    }
}
