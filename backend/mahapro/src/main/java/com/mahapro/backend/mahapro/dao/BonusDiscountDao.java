package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.BonusDiscount;

public interface BonusDiscountDao {
    List<BonusDiscount> findAll();

    BonusDiscount findById(int bonusDiscountId);
}
