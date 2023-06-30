package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.User.User;

import java.util.List;

public interface UserService {
    User findById(int id);
    List<User> findByUniversityId(int universityId);
    User findByFirebaseUserId(String firebaseUserId);

    void save(String jsonPayload) throws Exception;
    void verify_user(int userId);
    boolean login(int userId);

}