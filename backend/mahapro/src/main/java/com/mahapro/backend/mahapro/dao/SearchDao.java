package com.mahapro.backend.mahapro.dao;

import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.UserSearch;

import java.util.List;

public interface SearchDao {
    List<Business> searchByQuery(String query);

    List<Business> searchByCategory(int category);

    List<Business> searchByLocation(double latitude, double longitude);

    List<Business> getSearchHistory(int userId);
    void addToSearchHistory(UserSearch userSearch);
}