package com.mahapro.backend.mahapro.dao;

import java.util.List;

import org.locationtech.jts.geom.Point;

import com.mahapro.backend.mahapro.model.User.User;


public interface UserDao {
    List<User> findAll();

    User findById(int userId);
    List<User> findByUniversityId(int universityId);
    User findByFirebaseUserId(String firebaseUserId);
    User findByFavoriteId(int favoriteId);

    void save(User user);
    void verifyUser(int userId);
    void updateLocation(int userId, Point userLocation);
    boolean login(int userId);
}
