package com.mahapro.backend.mahapro.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.proxy.HibernateProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mahapro.backend.mahapro.dao.AllowedBranchDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.Business.Branch.AllowedBranch;
import com.mahapro.backend.mahapro.model.Business.Discount.Discount;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

@Repository
public class AllowedBranchDaoImpl implements AllowedBranchDao {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<AllowedBranch> findAll() {
        TypedQuery<AllowedBranch> query = entityManager.createQuery("SELECT * FROM allowed_branch;",
                AllowedBranch.class);
        return query.getResultList();
    }

    @Override
    public List<AllowedBranch> findAllByDiscountId(int discountId) {
        try {
            Query query = entityManager
                    .createNativeQuery("SELECT * FROM allowed_branch WHERE discount_id = :discountId", AllowedBranch.class);
            query.setParameter("discountId", discountId);

            List<AllowedBranch> allowedBranches = (List<AllowedBranch>) query.getResultList();

            return allowedBranches;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public AllowedBranch findById(int allowedBranchId) {
        try {
            Query query = entityManager.createNativeQuery(
                    "SELECT * FROM allowed_branch WHERE allowed_branch_id = :allowedBranchId", AllowedBranch.class);
            query.setParameter("allowedBranchId", allowedBranchId);

            System.out.println("Got request");

            AllowedBranch allowedBranch = (AllowedBranch) query.getResultList().get(0);
            return allowedBranch;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
