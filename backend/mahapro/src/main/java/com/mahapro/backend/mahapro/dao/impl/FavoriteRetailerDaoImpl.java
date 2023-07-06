package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.FavoriteRetailerDao;
import com.mahapro.backend.mahapro.model.FavoriteRetailer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FavoriteRetailerDaoImpl implements FavoriteRetailerDao {

    @Autowired
    EntityManager entityManager;

    @Override
    public List<FavoriteRetailer> findAll() {
        return null;
    }

    @Override
    public FavoriteRetailer findById(int favoriteRetailerId) {
        return null;
    }

    @Override
    public List<FavoriteRetailer> findByUserId(int userId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM favorite_retailer WHERE user_id = :userId", FavoriteRetailer.class);
        query.setParameter("userId", userId);

        return (List<FavoriteRetailer>) query.getResultList();
    }

    @Override
    public List<FavoriteRetailer> findByBusinessId(int businessId) {
        return null;
    }
}
