package com.mahapro.backend.mahapro.dao.impl;

import java.util.List;

import org.locationtech.jts.geom.Point;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mahapro.backend.mahapro.dao.UserDao;
import com.mahapro.backend.mahapro.model.User.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<User> findAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findAll'");
    }

    @Override
    public User findById(int userId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM public.\"user\" WHERE user_id = :userId", User.class);
        query.setParameter("userId", userId);

        return (User) query.getSingleResult();
    }

    @Override
    public List<User> findByUniversityId(int universityId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM public.\"user\" WHERE university_id = :universityId", User.class);
        query.setParameter("universityId", universityId);

        return (List<User>) query.getResultList();
    }

    @Override
    public User findByFirebaseUserId(String firebaseUserId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM public.\"user\" WHERE firebase_user_id = :firebaseUserId", User.class);
        query.setParameter("firebaseUserId", firebaseUserId);

        return (User) query.getSingleResult();
    }

    @Override
    public User findByFavoriteId(int favoriteId) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByFavoriteId'");
    }

    @Override
    public void save(User user) {
        Query query = entityManager.createNativeQuery("INSERT INTO public.\"user\"(	user_id, first_name, last_name, personal_email, school_email,date_of_birth, university_id, firebase_user_id, email_verified) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", User.class);
    }

    @Override
    public void verifyUser(int userId) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'verifyUser'");
    }

    @Override
    public void updateLocation(int userId, Point userLocation) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updateLocation'");
    }

    @Override
    public boolean login(int userId) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'login'");
    }

    
}
