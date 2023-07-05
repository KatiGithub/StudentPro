package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.Business.Business;

import java.util.List;

public interface SearchService {
    List<Business> searchByQuery(String query);

    List<Business> searchByLocation(double longitude, double latitude);

    List<Business> searchByCategory(int categoryId);
}
