package com.mahapro.backend.mahapro.service.impl;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.BusinessDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.User.User;
import com.mahapro.backend.mahapro.service.BusinessService;
import com.mahapro.backend.mahapro.service.UserService;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusinessServiceImpl implements BusinessService {

    @Autowired
    BusinessDao businessDao;

    @Autowired
    FirebaseAuth firebaseAuth;

    @Autowired
    UserService userService;

    @Override
    public List<Business> findBusinessByRandom() {
        return businessDao.findByRandom();
    }

    @Override
    public void addBusinessUserClick(String authorizationHeader, int retailerId) throws Exception {
        String jwtToken = JwtTokenProvider.getToken(authorizationHeader);
        FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

        User user = userService.findByFirebaseUserId(firebaseToken.getUid());

        businessDao.addBusinessUserClick(user.getUserId(), retailerId);
    }
}
