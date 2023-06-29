package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.TransactionDao;
import com.mahapro.backend.mahapro.model.Transaction;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TransactionDaoImpl implements TransactionDao {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<Transaction> findAll() {
        return null;
    }

    @Override
    public Transaction findById(int transactionId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM transaction WHERE transaction_id = :transactionId", Transaction.class);
        query.setParameter("transactionId", transactionId);

        return (Transaction) query.getSingleResult();
    }

    @Override
    public List<Transaction> findByUserId(int userId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM transaction WHERE user_id = :userId", Transaction.class);
        query.setParameter("userId", userId);

        return (List<Transaction>) query.getResultList();
    }

    @Override
    public List<Transaction> findByDiscountId(int discountId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM transaction WHERE discount_id = :discountId");
        query.setParameter("discountId", discountId);

        return (List<Transaction>) query.getResultList();
    }

    @Override
    public List<Transaction> findByBranchId(int branchId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM transaction WHERE branch_id = :branchId");
        query.setParameter("branchId", branchId);

        return (List<Transaction>) query.getResultList();
    }

    @Override
    public Transaction claimCoupon(int discountId, int userId, String couponCode) {
        Query query = entityManager.createNativeQuery("SELECT * FROM insert_transaction(:couponCode, :userId, :discountId)", Transaction.class);
        query.setParameter("couponCode", couponCode);
        query.setParameter("userId", userId);
        query.setParameter("discountId", discountId);

        return (Transaction) query.getSingleResult();
    }

    @Override
    public Boolean checkUserLimit(int discountId, int userId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM check_user_limit(:userId , :discountId)", Boolean.class);
        query.setParameter("userId", userId);
        query.setParameter("discountId", discountId);

        return (Boolean) query.getSingleResult();
    }
}
