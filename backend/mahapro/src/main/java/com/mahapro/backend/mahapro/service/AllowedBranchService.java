package com.mahapro.backend.mahapro.service;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Branch.AllowedBranch;

public interface AllowedBranchService {
    List<AllowedBranch> findAll();

    AllowedBranch findById(int branchId);
    List<AllowedBranch> findByDiscountId(int discountId);
}
