package com.mahapro.backend.mahapro.dao;

import java.util.List;

import org.locationtech.jts.geom.Point;

import com.mahapro.backend.mahapro.model.User.User;


public interface UserDao {
    List<User> findAll();

    User findById(int userId);
    List<User> findByUniversityId(int universityId);
    User findByFirebaseUserId(String firebaseUserId);
    void save(User user);
    void verifyUser(int userId);
    User login(int userId);
}
