package com.mahapro.backend.mahapro.service.business.impl;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.Business.ActivationCodeDao;
import com.mahapro.backend.mahapro.dao.Business.BusinessUserDao;
import com.mahapro.backend.mahapro.model.BusinessUser;
import com.mahapro.backend.mahapro.service.business.BusinessUserService;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusinessUserServiceImpl implements BusinessUserService {

    @Autowired
    FirebaseAuth firebaseAuth;

    @Autowired
    BusinessUserDao businessUserDao;

    @Autowired
    ActivationCodeDao activationCodeDao;

    @Override
    public BusinessUser login(String authorizationHeader) throws Exception {

        String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
        FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

        BusinessUser businessUser = businessUserDao.getBusinessUserByFirebaseUserId(firebaseToken.getUid());
        return businessUser;
    }

    @Override
    public BusinessUser register(String authorizationHeader, BusinessUser businessUser) {
        return null;
    }

    @Override
    public BusinessUser getBusinessUserFromCode(String code) {
        return activationCodeDao.getBusinessUserFromActivationCode(code);
    }

    @Override
    public void confirmEmailVerified(String authorizationHeader) {

    }
}
