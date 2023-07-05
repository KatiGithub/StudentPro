package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.SearchDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SearchDaoImpl implements SearchDao {

    @Autowired
    EntityManager entityManager;

    @Override
    public List<Business> searchByQuery(String query) {
        Query sqlQuery = entityManager.createNativeQuery("SELECT * FROM search_retailer_by_query(:query)", Business.class);
        sqlQuery.setParameter("query", query);
        
        return (List<Business>) sqlQuery.getResultList();
    }

    @Override
    public List<Business> searchByCategory(int category) {
        return null;
    }

    @Override
    public List<Business> searchByLocation(double latitude, double longitude) {
        Query query = entityManager.createNativeQuery("SELECT * FROM search_retailer_by_location(:longitude, :latitude)", Business.class);
        query.setParameter("longitude", longitude);
        query.setParameter("latitude", latitude);

        return (List<Business>) query.getResultList();
    }

    @Override
    public List<Business> getSearchHistory(int userId) {
        return null;
    }
}
