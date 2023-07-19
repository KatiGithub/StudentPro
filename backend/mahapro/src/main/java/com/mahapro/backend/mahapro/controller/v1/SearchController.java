package com.mahapro.backend.mahapro.controller.v1;

import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.service.SearchService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    SearchService searchService;

    @GetMapping
    public ResponseEntity<String> searchRetailerByQuery(@RequestHeader("Authorization") String authorizationHeader,
                                                        @RequestParam("query") String query) {
        try {
            List<Business> businesses = searchService.searchByQuery(query, authorizationHeader);

            return ResponseEntity.ok(businesses.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/location")
    public ResponseEntity<String> searchRetailerByLocation(
            @RequestHeader("Authorization") String authorizationHeader,
            @RequestParam("longitude") double longitude,
            @RequestParam("latitude") double latitude
    ) {
        try {
            List<Business> businesses = searchService.searchByLocation(longitude, latitude, authorizationHeader);

            return ResponseEntity.ok(businesses.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/category")
    public ResponseEntity<String> searchRetailerByCategory(
            @RequestHeader("Authorization") String authorizationHeader,
            @RequestParam("categoryId") int categoryId
    ) {
        try {
            List<Business> businesses = searchService.searchByCategory(categoryId, authorizationHeader);
            String answer = businesses.toString();

            return ResponseEntity.ok(answer);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/history")
    public ResponseEntity<String> getSearchHistory(
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        try {
            return ResponseEntity.ok(searchService.getSearchHistory(authorizationHeader).toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
