package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Discount.Discount;

public interface DiscountDao {
    List<Discount> findAll();
    Discount findById(int discountId);

    List<Discount> findByBusinessId(int businessId);
}
