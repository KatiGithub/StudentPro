package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.FavoriteRetailerDao;
import com.mahapro.backend.mahapro.model.FavoriteRetailer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
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

    @Override
    public boolean checkFavoriteRetailer(int userId, int businessId) {
        Query query = entityManager.createNativeQuery("SELECT COUNT(*) FROM favorite_retailer WHERE user_id = :userId AND business_id = :businessId", int.class);
        query.setParameter("userId", userId);
        query.setParameter("businessId", businessId);

        int count = (int) query.getSingleResult();
        return count > 0;
    }

    @Override
    @Transactional
    public void like(int userId, int businessId) {
        Query query = entityManager.createNativeQuery("INSERT INTO favorite_retailer(user_id, business_id) VALUES (:userId, :businessId)");
        query.setParameter("userId", userId);
        query.setParameter("businessId", businessId);

        query.executeUpdate();
    }

    @Override
    @Transactional
    public void unlike(int userId, int businessId) {
        Query query = entityManager.createNativeQuery("DELETE FROM favorite_retailer WHERE user_id = :userId AND business_id = :businessId");
        query.setParameter("userId", userId);
        query.setParameter("businessId", businessId);

        query.executeUpdate();
    }
}
