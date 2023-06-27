package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Discount.DiscountType;

public interface DiscountTypeDao {
    List<DiscountType> findAll();

    DiscountType findById(int discountTypeId);
}
