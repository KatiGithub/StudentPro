package com.mahapro.backend.mahapro.dao;

import java.util.List;

public interface User {
    List<User> findAll();

    User findById(int userId);
    List<User> findByUniversityId(int universityId);
    User findByFirebaseUserId(String firebaseUserId);
    User findByFavoriteId(int favoriteId);
}
