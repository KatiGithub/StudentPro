package com.mahapro.backend.mahapro.service.impl;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.TransactionDao;
import com.mahapro.backend.mahapro.dao.UserDao;
import com.mahapro.backend.mahapro.model.Transaction;
import com.mahapro.backend.mahapro.service.TransactionService;
import com.mahapro.backend.mahapro.shared.exception.LimitReachedException;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import com.mahapro.backend.mahapro.shared.utils.CouponCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionDao transactionDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private FirebaseAuth firebaseAuth;


    @Override
    public List<Transaction> findByUserId(int userId) {
        return transactionDao.findByUserId(userId);
    }

    @Override
    public List<Transaction> findByBranchId(int branchId) {
        return transactionDao.findByBranchId(branchId);
    }

    @Override
    public List<Transaction> findByDiscountId(int discountId) {
        return transactionDao.findByDiscountId(discountId);
    }

    @Override
    public Transaction claimCoupon(int discountId, String authorizationHeader) throws LimitReachedException {
        try {
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(JwtTokenProvider.getToken(authorizationHeader));
            String uid = firebaseToken.getUid();

            int userId = userDao.findByFirebaseUserId(uid).getUserId();
            if(!transactionDao.checkUserLimit(discountId, userId)) {
                throw new LimitReachedException("");
            }

            String couponCode = CouponCodeUtil.generateCouponCode();

            return transactionDao.claimCoupon(discountId, userId, couponCode);

        } catch (LimitReachedException e) {
            throw new LimitReachedException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void checkUserLimit(int discountId, String authorizationHeader) throws Exception {

        FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(JwtTokenProvider.getToken(authorizationHeader));
        String firebaseUserId = firebaseToken.getUid();

        int userId = userDao.findByFirebaseUserId(firebaseUserId).getUserId();

        if(!transactionDao.checkUserLimit(discountId, userId)) {
            throw new LimitReachedException("");
        }
    }
}
