package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Transaction;

public interface TransactionDao {
    List<Transaction> findAll();

    Transaction findById(int transactionId);
    List<Transaction> findByUserId(int userId);
    List<Transaction> findByDiscountId(int discountId);
    List<Transaction> findByBranchId(int branchId);
}
