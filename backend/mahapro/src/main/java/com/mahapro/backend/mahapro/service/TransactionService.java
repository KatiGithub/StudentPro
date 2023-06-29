package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.Transaction;
import com.mahapro.backend.mahapro.shared.exception.LimitReachedException;

import java.util.List;

public interface TransactionService {
    List<Transaction> findByUserId(int userId);

    List<Transaction> findByBranchId(int branchId);

    List<Transaction> findByDiscountId(int discountId);

    Transaction claimCoupon(int discountId, String authorizationHeader) throws LimitReachedException;

    void checkUserLimit(int discountId, String authorizationHeader) throws Exception;
}
