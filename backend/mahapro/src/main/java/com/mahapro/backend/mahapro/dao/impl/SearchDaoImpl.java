package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.SearchDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.UserSearch;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Nullable;
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
        Query query = entityManager.createNativeQuery("SELECT * FROM business WHERE business_type_id = :categoryId", Business.class);
        query.setParameter("categoryId", category);

        return (List<Business>) query.getResultList();
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
        Query query = entityManager.createNativeQuery("SELECT DISTINCT b.* FROM (SELECT * FROM user_retailer_clicks ORDER BY time_clicked DESC ) r JOIN business b ON r.retailer_id = b.business_id WHERE user_id = :userId LIMIT 2", Business.class);
        query.setParameter("userId", userId);

        List<Business> businesses = (List<Business>) query.getResultList();
        return businesses;
    }

    @Override
    @Transactional
    public void addToSearchHistory(UserSearch userSearch) {
        Query query = entityManager.createNativeQuery("INSERT INTO user_search(user_id, query, longitude, latitude, business_type_id, timestamp) VALUES (:userId, :query, :longitude, :latitude, :businessTypeId, get_current_unix_timestamp())");
        query.setParameter("userId", userSearch.getUserId().getUserId());
        query.setParameter("query", userSearch.getQuery());
        query.setParameter("longitude", userSearch.getLongitude());
        query.setParameter("latitude", userSearch.getLatitude());

        if(userSearch.getBusinessType() != null) {
            query.setParameter("businessTypeId", userSearch.getBusinessType().getId());
        } else {
            query.setParameter("businessTypeId", null);
        }

        query.executeUpdate();
    }
}
