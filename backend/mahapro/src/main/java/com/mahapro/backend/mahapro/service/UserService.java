package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.User.User;

import java.util.List;

public interface UserService {
    User findById(int id);
    List<User> findByUniversityId(int universityId);
    User findByFirebaseUserId(String firebaseUserId);

    User save(String jsonPayload, String authorizationHeader) throws Exception;
    void verify_user(String authorizationHeader);
    User login(String authorizationHeader) throws Exception;

    boolean checkUser(String uid);
}
