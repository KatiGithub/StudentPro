package com.mahapro.backend.mahapro.dao.Business.impl;

import com.mahapro.backend.mahapro.dao.Business.ActivationCodeDao;
import com.mahapro.backend.mahapro.model.BusinessUser;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ActivationCodeDaoImpl implements ActivationCodeDao {

    @Autowired
    EntityManager entityManager;

    @Override
    public BusinessUser getBusinessUserFromActivationCode(String code) {
        Query query = entityManager.createNativeQuery("SELECT b.* FROM activation_code ac JOIN business_user b on b.business_user_id = ac.business_user_id WHERE ac = :code", BusinessUser.class);
        query.setParameter("code", code);

        BusinessUser _businessUser = (BusinessUser) query.getSingleResult();
        return _businessUser;
    }

    @Override
    public void deleteAllCodeForBusinessUser(int businessUserId) {

    }

    @Override
    public void createCodeForBusinessUser(BusinessUser businessUser) {

    }

    @Override
    public String getLatestCodeForBusinessUser(BusinessUser businessUser) {
        return null;
    }
}
