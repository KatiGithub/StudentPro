package com.mahapro.backend.mahapro.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.UserDao;
import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.service.UniversityDomainService;
import com.mahapro.backend.mahapro.service.UserService;
import com.mahapro.backend.mahapro.shared.exception.UniversityNotFound;
import com.mahapro.backend.mahapro.shared.provider.EmailDomainProvider;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    FirebaseAuth firebaseAuth;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private UniversityDomainService universityDomainService;

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
    public User save(String jsonPayload, String authorizationHeader) throws Exception {
        String uid = null;
        try {
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(JwtTokenProvider.getToken(authorizationHeader));
            uid = firebaseToken.getUid();

            User user = this.objectMapper.readValue(jsonPayload, User.class);
            String email = firebaseToken.getEmail();
            if (!email.equals(user.getSchoolEmail())) {
                throw new Exception();
            }
            user.setFirebaseUserId(uid);
            user.setUniversity(universityDomainService.findByDomain(EmailDomainProvider.getEmailDomain(email)).getUniversity());

            return userDao.save(user);
        } catch (JsonProcessingException e) {
            firebaseAuth.deleteUser(uid);
            throw new Exception(e.getMessage());
        } catch (UniversityNotFound e) {
            firebaseAuth.deleteUser(uid);
            throw new UniversityNotFound();
        } catch (Exception e) {
            firebaseAuth.deleteUser(uid);
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
            String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
            firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            String uid = firebaseToken.getUid();
            User user = userDao.findByFirebaseUserId(uid);

            return userDao.login(userDao.findByFirebaseUserId(uid).getUserId());
        } catch (EmptyResultDataAccessException e) {
//            firebaseAuth.deleteUser(firebaseToken.getUid());
            throw e;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    }

    @Override
    public boolean checkUser(String uid) {
        return false;
    }
}
