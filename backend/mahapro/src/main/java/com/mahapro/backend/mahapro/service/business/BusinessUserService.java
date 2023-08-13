package com.mahapro.backend.mahapro.service.business;

import com.google.firebase.auth.FirebaseAuthException;
import com.mahapro.backend.mahapro.model.BusinessUser;

public interface BusinessUserService {
    public BusinessUser login(String authorizationHeader) throws Exception;
    public BusinessUser register(String authorizationHeader, BusinessUser businessUser);
    public BusinessUser getBusinessUserFromCode(String code);
    public void confirmEmailVerified(String authorizationHeader);
}
