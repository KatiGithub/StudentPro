package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    SearchService searchService;

    @GetMapping
    public ResponseEntity<String> searchRetailerByQuery(@RequestParam("query") String query) {
        try {
            List<Business> businesses = searchService.searchByQuery(query);

            return ResponseEntity.ok(businesses.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/location")
    public ResponseEntity<String> searchRetailerByLocation(
            @RequestParam("longitude") double longitude,
            @RequestParam("latitude") double latitude
            ) {
        try {
            List<Business> businesses = searchService.searchByLocation(longitude, latitude);

            return ResponseEntity.ok(businesses.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

//    @GetMapping("/category")
//    public ResponseEntity<String> searchRetailerByCategory(
//        @RequestParam("categoryId") int categoryId
//    ) {
//
//    }
}
