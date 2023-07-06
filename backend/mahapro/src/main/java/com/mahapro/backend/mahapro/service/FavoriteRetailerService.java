package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.FavoriteRetailer;

import java.util.List;

public interface FavoriteRetailerService {
    public List<FavoriteRetailer> findByUserId(String authorizationHeader);
}
