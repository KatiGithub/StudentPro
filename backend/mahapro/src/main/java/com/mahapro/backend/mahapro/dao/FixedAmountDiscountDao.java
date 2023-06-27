package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.FixedAmountDiscount;

public interface FixedAmountDiscountDao {
    List<FixedAmountDiscount> findAll();

    FixedAmountDiscount findById(int fixedAmountDiscountId);
}
