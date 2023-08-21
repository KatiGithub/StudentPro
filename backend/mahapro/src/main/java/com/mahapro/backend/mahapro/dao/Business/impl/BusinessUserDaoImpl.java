package com.mahapro.backend.mahapro.dao.Business.impl;

import com.mahapro.backend.mahapro.dao.Business.BusinessUserDao;
import com.mahapro.backend.mahapro.model.BusinessUser;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.hibernate.sql.Update;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BusinessUserDaoImpl implements BusinessUserDao {

    @Autowired
    EntityManager entityManager;

    @Override
    public BusinessUser saveUser(BusinessUser businessUser) {
        Query query = entityManager.createNativeQuery("SELECT * FROM insert_business_user(p_firebase_user_id := :firebaseUserId, p_business_id := :businessId, p_name := :name, p_can_claim_coupon := :canClaimCoupon, p_can_edit_discount := :canEditDiscount, p_can_edit_business_user := :canEditBusinessUser, p_can_edit_business_info := :canEditBusinessInfo, p_can_edit_admin := :canEditAdmin, p_email := :email)", BusinessUser.class);
        query.setParameter("firebaseUserId", businessUser.getFirebaseUserId());
        query.setParameter("businessId", businessUser.getBusiness().getId());
        query.setParameter("name", businessUser.getName());
        query.setParameter("canClaimCoupon", businessUser.getCanClaimCoupon());
        query.setParameter("canEditDiscount", businessUser.getCanEditDiscount());
        query.setParameter("canEditBusinessUser", businessUser.getCanEditBusinessUser());
        query.setParameter("canEditBusinessInfo", businessUser.getCanEditBusinessinfo());
        query.setParameter("canEditAdmin", businessUser.getCanEditAdmin());
        query.setParameter("email", businessUser.getEmail());

        BusinessUser _businessUser = (BusinessUser) query.getSingleResult();
        return _businessUser;
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

    @Override
    public BusinessUser getBusinessUserById(int businessUserId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM business_user WHERE business_user_id = :businessUserId", BusinessUser.class);
        query.setParameter("businessUserId", businessUserId);

        BusinessUser _businessUser = (BusinessUser) query.getSingleResult();
        return _businessUser;
    }

    @Override
    @Transactional
    @Modifying
    public void activateBusinessCodeUser(String uid, int businessUserId) {
        Query query = entityManager.createNativeQuery("UPDATE business_user SET firebase_user_id =:uid WHERE business_user_id = :businessUserId");
        query.setParameter("uid", uid);
        query.setParameter("businessUserId", businessUserId);

        query.executeUpdate();
    }

    @Override
    @Transactional
    public void businessUserEmailVerified(int businessUserId) {
        Query query = entityManager.createNativeQuery("UPDATE business_user SET email_verified = TRUE WHERE business_user_id = :businessUserId");
        query.setParameter("businessUserId", businessUserId);

        query.executeUpdate();
    }
}