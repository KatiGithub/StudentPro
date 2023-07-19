package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.FavoriteRetailer;

import java.util.List;

public interface FavoriteRetailerService {
    public List<FavoriteRetailer> findByUserId(String authorizationHeader);
    public boolean checkUser(String authorizationHeader, int businessId) throws Exception;
    public void favoritePressed(String authorizationHeader, int businessId);
}
