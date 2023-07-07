package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.DiscountDao;
import com.mahapro.backend.mahapro.model.Business.Discount.Discount;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DiscountDaoImpl implements DiscountDao {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<Discount> findAll() {
        return null;
    }

    @Override
    public Discount findById(int discountId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM discount WHERE discount_id = :discountId", Discount.class);
        query.setParameter("discountId", discountId);
        return (Discount) query.getSingleResult();
    }

    @Override
    public List<Discount> findByBusinessId(int businessId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM discount WHERE business_id = :businessId", Discount.class);
        query.setParameter("businessId", businessId);

        return (List<Discount>) query.getResultList();
    }

    @Override
    public List<Discount> findByLocation(double longitude, double latitude) {
        Query query = entityManager.createNativeQuery("SELECT * FROM get_discounts_by_branches(:longitude, :latitude)", Discount.class);
        query.setParameter("longitude", longitude);
        query.setParameter("latitude", latitude);

        return (List<Discount>) query.getResultList();
    }

    @Override
    public List<Discount> findByRandom() {
        Query query = entityManager.createNativeQuery("SELECT * FROM get_discounts_by_random()", Discount.class);

        return (List<Discount>) query.getResultList();
    }
}
