package com.mahapro.backend.mahapro.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.SearchDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.Business.BusinessType;
import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.model.UserSearch;
import com.mahapro.backend.mahapro.service.SearchService;
import com.mahapro.backend.mahapro.service.UserService;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    SearchDao searchDao;

    @Autowired
    FirebaseAuth firebaseAuth;

    @Autowired
    UserService userService;

    @Autowired
    ObjectMapper objectMapper;

    @Override
    public List<Business> searchByQuery(String query, String authorizationHeader) throws Exception {
        User user = getUserId(authorizationHeader);
        UserSearch userSearch = new UserSearch();
        userSearch.setUserId(user);
        userSearch.setQuery(query);

        searchDao.addToSearchHistory(userSearch);
        return searchDao.searchByQuery(query);
    }

    @Override
    public List<Business> searchByLocation(double longitude, double latitude, String authorizationHeader) throws Exception {
        User user = getUserId(authorizationHeader);
        UserSearch userSearch = new UserSearch();
        userSearch.setUserId(user);
        userSearch.setUserId(user);
        userSearch.setLongitude(longitude);
        userSearch.setLatitude(latitude);

        searchDao.addToSearchHistory(userSearch);
        return searchDao.searchByLocation(latitude, longitude);
    }

    @Override
    public List<Business> searchByCategory(int categoryId, String authorizationHeader) throws Exception {
        User user = getUserId(authorizationHeader);

        UserSearch userSearch = new UserSearch();
        userSearch.setUserId(user);
        BusinessType businessType = new BusinessType();
        businessType.setId(categoryId);
        userSearch.setBusinessType(businessType);

        searchDao.addToSearchHistory(userSearch);

        return searchDao.searchByCategory(categoryId);
    }

    private User getUserId(String authorizationHeader) throws Exception {
        try {
            String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            return userService.findByFirebaseUserId(firebaseToken.getUid());

        } catch (Exception e) {
            throw new Exception("authorization header error");
        }
    }

    @Override
    public List<Business> getSearchHistory(String authorizationHeader) throws Exception {
        try {
            String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            int userId = userService.findByFirebaseUserId(firebaseToken.getUid()).getUserId();

            return searchDao.getSearchHistory(userId);
        } catch (Exception e) {
            throw new Exception();
        }
    }
}
