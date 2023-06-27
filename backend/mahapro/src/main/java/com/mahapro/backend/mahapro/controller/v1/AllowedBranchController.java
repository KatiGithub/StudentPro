package com.mahapro.backend.mahapro.controller.v1;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mahapro.backend.mahapro.model.Business.Branch.AllowedBranch;
import com.mahapro.backend.mahapro.service.AllowedBranchService;

@RequestMapping(value = "/allowed_branch", produces = MediaType.APPLICATION_JSON_VALUE)
@Controller
// @ApiController
public class AllowedBranchController{
    private final AllowedBranchService allowedBranchService;

    public AllowedBranchController(AllowedBranchService allowedBranchService) {
        this.allowedBranchService = allowedBranchService;
    }

    @GetMapping("/{id}/")
    public ResponseEntity<String> findAllowedBranchById(@PathVariable("id") int id) {
        try {
            AllowedBranch allowedBranch = allowedBranchService.findById(id);

            return ResponseEntity.ok(allowedBranch.toString());
        }catch ( Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/discount/{id}/")
    public ResponseEntity<String> findAllowedBranchByDiscountId(@PathVariable("id") int id) {
        try {
            List<AllowedBranch> allowedBranch = allowedBranchService.findByDiscountId(id);

            return ResponseEntity.ok(allowedBranch.toString());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
