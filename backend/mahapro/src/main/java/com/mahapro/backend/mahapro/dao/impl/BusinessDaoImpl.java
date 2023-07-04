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
}
