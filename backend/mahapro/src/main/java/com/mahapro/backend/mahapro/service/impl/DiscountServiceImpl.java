package com.mahapro.backend.mahapro.service.impl;

import com.mahapro.backend.mahapro.dao.DiscountDao;
import com.mahapro.backend.mahapro.model.Business.Discount.Discount;
import com.mahapro.backend.mahapro.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountServiceImpl implements DiscountService {

    @Autowired
    private DiscountDao discountDao;

    @Override
    public Discount findById(int discountId) {
        return discountDao.findById(discountId);
    }

    @Override
    public List<Discount> findByBusinessId(int businessId) {
        return discountDao.findByBusinessId(businessId);
    }

    @Override
    public List<Discount> findByLocation(double longitude, double latitude) {
        return discountDao.findByLocation(longitude, latitude);
    }

    @Override
    public List<Discount> findByRandom() {
        return discountDao.findByRandom();
    }
}
