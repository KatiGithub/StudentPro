package com.mahapro.backend.mahapro.service.impl;

import com.mahapro.backend.mahapro.dao.SearchDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    SearchDao searchDao;

    @Override
    public List<Business> searchByQuery(String query) {
        return searchDao.searchByQuery(query);
    }

    @Override
    public List<Business> searchByLocation(double longitude, double latitude) {
        return searchDao.searchByLocation(latitude, longitude);
    }

    @Override
    public List<Business> searchByCategory(int categoryId) {
        return null;
    }
}
