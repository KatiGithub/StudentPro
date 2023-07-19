package com.mahapro.backend.mahapro.service.impl;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.FavoriteRetailerDao;
import com.mahapro.backend.mahapro.model.FavoriteRetailer;
import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.service.FavoriteRetailerService;
import com.mahapro.backend.mahapro.service.UserService;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoriteRetailerServiceImpl implements FavoriteRetailerService {

    @Autowired
    FavoriteRetailerDao favoriteRetailerDao;

    @Autowired
    UserService userService;

    @Autowired
    FirebaseAuth firebaseAuth;

    @Override
    public List<FavoriteRetailer> findByUserId(String authorizationHeader) {
        try {
            String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            User user = userService.findByFirebaseUserId(firebaseToken.getUid());

            return favoriteRetailerDao.findByUserId(user.getUserId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkUser(String authorizationHeader, int businessId) throws Exception {
        try {
            String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            int userId = userService.findByFirebaseUserId(firebaseToken.getUid()).getUserId();
            return favoriteRetailerDao.checkFavoriteRetailer(userId, businessId);
        } catch (Exception e) {
            throw new Exception("Error while checking for like/dislike");
        }
    }

    @Override
    public void favoritePressed(String authorizationHeader, int businessId) {
        try {
            String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            int userId = userService.findByFirebaseUserId(firebaseToken.getUid()).getUserId();
            if (favoriteRetailerDao.checkFavoriteRetailer(userId, businessId)) {
                favoriteRetailerDao.unlike(userId, businessId);
            } else {
                favoriteRetailerDao.like(userId, businessId);
            }
        } catch (Exception e) {
        }
    }
}
