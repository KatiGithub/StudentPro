package com.mahapro.backend.mahapro.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.UserDao;
import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.service.UserService;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    FirebaseAuth firebaseAuth;

    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    public List<User> findByUniversityId(int universityId) {
        return userDao.findByUniversityId(universityId);
    }

    @Override
    public User findByFirebaseUserId(String firebaseUserId) {
        return userDao.findByFirebaseUserId(firebaseUserId);
    }

    @Override
    public void save(String jsonPayload, String authorizationHeader) throws Exception {
        try {
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(JwtTokenProvider.getToken(authorizationHeader));
            String uid = firebaseToken.getUid();

            User user = this.objectMapper.readValue(jsonPayload, User.class);
            if(firebaseToken.getEmail() != user.getSchoolEmail()) {
                throw new Exception();
            }
            userDao.save(user);
        } catch (JsonProcessingException e) {
            throw new Exception(e.getMessage());
        } catch (Exception e) {
            throw new Exception();
        }
    }

    @Override
    public void verify_user(String authorizationHeader) {
        try {
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(JwtTokenProvider.getToken(authorizationHeader));
            User user = userDao.findByFirebaseUserId(firebaseToken.getUid());

            userDao.verifyUser(user.getUserId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public User login(String authorizationHeader) throws Exception {
        FirebaseToken firebaseToken = null;
        try {
            firebaseToken = firebaseAuth.verifyIdToken(JwtTokenProvider.getToken(authorizationHeader));

            String uid = firebaseToken.getUid();
            User user = userDao.findByFirebaseUserId(uid);

            return userDao.login(userDao.findByFirebaseUserId(uid).getUserId());
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    }

    @Override
    public boolean checkUser(String uid) {
        return false;
    }
}
