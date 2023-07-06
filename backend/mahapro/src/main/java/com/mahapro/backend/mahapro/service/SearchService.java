package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.Business.Business;

import java.util.List;

public interface SearchService {
    List<Business> searchByQuery(String query, String authorizationHeader) throws Exception;

    List<Business> searchByLocation(double longitude, double latitude, String authorizationHeader) throws Exception;

    List<Business> searchByCategory(int categoryId, String authorizationHeader) throws Exception;

}
