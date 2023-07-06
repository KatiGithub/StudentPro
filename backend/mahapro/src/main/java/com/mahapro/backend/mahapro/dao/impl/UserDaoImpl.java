package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.UserDao;
import com.mahapro.backend.mahapro.model.User.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    @Transactional
    public User save(User user) {
        Query query = entityManager.createNativeQuery(
                "SELECT * FROM insert_user(:firstName, :lastName, :personalEmail, :schoolEmail, :dateOfBirth, :universityId, :firebaseUserId)",
                User.class
        );
        query.setParameter("firstName", user.getFirstName());
        query.setParameter("lastName", user.getLastName());
        query.setParameter("personalEmail", user.getPersonalEmail());
        query.setParameter("schoolEmail", user.getSchoolEmail());
        query.setParameter("dateOfBirth", user.getDateOfBirth());
        query.setParameter("universityId", user.getUniversity().getId());
        query.setParameter("firebaseUserId", user.getFirebaseUserId());

        User _user = (User) query.getSingleResult();
        return _user;
    }

    @Transactional
    @Override
    public void verifyUser(int userId) {
        try {
            Query query = entityManager.createNativeQuery("SELECT * FROM verify_user(:userId)");
            query.setParameter("userId", userId);

            Object result = query.getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public User login(int userId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM \"user\" WHERE user_id = :userId", User.class);
        query.setParameter("userId", userId);

        return (User) query.getSingleResult();
    }


}
