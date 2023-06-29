package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.Business.Discount.Discount;

import java.util.List;

public interface DiscountService {
    Discount findById(int discountId);
    List<Discount> findByBusinessId(int businessId);
    List<Discount> findByLocation(double longitude, double latitude);
    List<Discount> findByRandom();
}
