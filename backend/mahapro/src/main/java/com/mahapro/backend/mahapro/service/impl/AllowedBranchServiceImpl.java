package com.mahapro.backend.mahapro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mahapro.backend.mahapro.dao.AllowedBranchDao;
import com.mahapro.backend.mahapro.model.Business.Branch.AllowedBranch;
import com.mahapro.backend.mahapro.service.AllowedBranchService;

@Service
// @Transactional
public class AllowedBranchServiceImpl implements AllowedBranchService {

    @Autowired
    AllowedBranchDao allowedBranchDao;

    @Override
    public List<AllowedBranch> findAll() {
        return this.allowedBranchDao.findAll();
    }

    @Override
    public AllowedBranch findById(int allowedBranchId) {
        return this.allowedBranchDao.findById(allowedBranchId);
    }

    @Override
    public List<AllowedBranch> findByDiscountId(int discountId) {
        return this.allowedBranchDao.findAllByDiscountId(discountId);
    }

}
