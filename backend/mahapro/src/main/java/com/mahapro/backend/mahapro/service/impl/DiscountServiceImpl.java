package com.mahapro.backend.mahapro.service.impl;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.DiscountDao;
import com.mahapro.backend.mahapro.dao.UserDao;
import com.mahapro.backend.mahapro.model.Business.Discount.Discount;
import com.mahapro.backend.mahapro.service.DiscountService;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountServiceImpl implements DiscountService {

    @Autowired
    private DiscountDao discountDao;

    @Autowired
    private FirebaseAuth firebaseAuth;

    @Autowired
    private UserDao userDao;

    @Override
    public Discount findById(int discountId) {
        return discountDao.findById(discountId);
    }

    @Override
    public List<Discount> findByBusinessId(int businessId) {
        return discountDao.findByBusinessId(businessId);
    }

    @Override
    public List<Discount> findByLocation(double longitude, double latitude) {
        return discountDao.findByLocation(longitude, latitude);
    }

    @Override
    public List<Discount> findByRandom() {
        return discountDao.findByRandom();
    }

    @Override
    public List<Discount> findByLastKnownUserLocation(String authorizationHeader) {
        try {
            String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            return discountDao.findByLastKnownUserLocation(
                    userDao.findByFirebaseUserId(
                            firebaseToken.getUid()).getUserId()
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
