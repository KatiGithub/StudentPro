package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Branch.AllowedBranch;

public interface AllowedBranchDao {
    List<AllowedBranch> findAll();

    AllowedBranch findById(int allowedBranchId);
    List<AllowedBranch> findAllByDiscountId(int discountId);
}
