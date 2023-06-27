package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.PercentageDiscount;

public interface PercentageDiscountDao {
    List<PercentageDiscount> findAll();

    PercentageDiscount findById(int percentageDiscountId);
}
