package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Business;

public interface BusinessDao {
    List<Business> findAll();

    Business findById(int businessId);
    Business findByFavoriteId(int favoriteId);
    Business findByEmail(String email);
}
