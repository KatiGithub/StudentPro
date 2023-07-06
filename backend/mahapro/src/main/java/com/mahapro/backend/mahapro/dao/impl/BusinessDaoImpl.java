package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.BusinessDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BusinessDaoImpl implements BusinessDao {

    @Autowired
    EntityManager entityManager;

    @Override
    public List<Business> findAll() {
        return null;
    }

    @Override
    public Business findById(int businessId) {
        return null;
    }

    @Override
    public Business findByFavoriteId(int favoriteId) {
        return null;
    }

    @Override
    public Business findByEmail(String email) {
        return null;
    }

    @Override
    public List<Business> findByRandom() {
        Query query = entityManager.createNativeQuery("SELECT * FROM business ORDER BY random() LIMIT 10", Business.class);

        return (List<Business>) query.getResultList();
    }

    @Override
    public void addBusinessUserClick(int userId, int businessId, double timeClicked) {
        Query query = entityManager.createNativeQuery("INSERT INTO user_retailer_clicks(user_id, retailer_id, time_clicked) VALUES (:userId, :businessId, :timeClicked)");
        query.setParameter("userId", userId);
        query.setParameter("retailerId", businessId);
        query.setParameter("timeClicked", timeClicked);

        query.getSingleResult();
    }
}
