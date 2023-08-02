package com.mahapro.backend.mahapro.dao.Business.impl;

import com.mahapro.backend.mahapro.dao.Business.BusinessUserDao;
import com.mahapro.backend.mahapro.model.BusinessUser;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BusinessUserDaoImpl implements BusinessUserDao {

    @Autowired
    EntityManager entityManager;

    @Override
    public BusinessUser saveUser(String businessUserId, String firebaseUserId, int businessId, int roleId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM insert_business_user(:businessUserId, :firebaseUserId, :businessId, :roleId)", BusinessUser.class);
        query.setParameter("businessUserId", businessUserId);
        query.setParameter("firebaseUserId", firebaseUserId);
        query.setParameter("businessId", businessId);
        query.setParameter("roleId", roleId);

        BusinessUser businessUser = (BusinessUser) query.getSingleResult();
        return businessUser;
    }

    @Override
    public List<BusinessUser> getBusinessUserByBusinessId(int businessId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM business_user WHERE business_id = :businessId", BusinessUser.class);
        query.setParameter("businessId", businessId);

        List<BusinessUser> businessUsers = (List<BusinessUser>) query.getResultList();
        return businessUsers;
    }

    @Override
    @Transactional
    public void deleteUser(int userToDeleteId) {
        Query query = entityManager.createNativeQuery("DELETE FROM business_user WHERE business_user_id = :businessUserId");
        query.setParameter("businessUserId", userToDeleteId);

        query.executeUpdate();
    }

    @Override
    public void changeUserPermission(int businessUserId, int roleId) {
        return;
    }

    @Override
    public BusinessUser getBusinessUserByFirebaseUserId(String firebaseUserId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM business_user WHERE firebase_user_id = :firebaseUserId", BusinessUser.class);
        query.setParameter("firebaseUserId", firebaseUserId);

        BusinessUser user = (BusinessUser) query.getSingleResult();
        return user;
    }
}
