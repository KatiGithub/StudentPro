package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.FavoriteRetailer;

public interface FavoriteRetailerDao {
    List<FavoriteRetailer> findAll();

    FavoriteRetailer findById(int favoriteRetailerId);
    List<FavoriteRetailer> findByUserId(int userId);
    List<FavoriteRetailer> findByBusinessId(int businessId);
}
