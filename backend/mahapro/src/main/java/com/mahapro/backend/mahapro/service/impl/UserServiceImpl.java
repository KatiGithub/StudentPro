package com.mahapro.backend.mahapro.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mahapro.backend.mahapro.dao.UserDao;
import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ObjectMapper objectMapper;

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
    public void save(String jsonPayload) throws Exception {
        try {
            User user = this.objectMapper.readValue(jsonPayload, User.class);
            userDao.save(user);
        } catch (JsonProcessingException e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void verify_user(int userId) {
        userDao.verifyUser(userId);
    }

    @Override
    public boolean login(int userId) {
        return userDao.login(userId);
    }
}
