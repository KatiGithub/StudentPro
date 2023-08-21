package com.mahapro.backend.mahapro.service.business;

import com.google.firebase.auth.FirebaseAuthException;
import com.mahapro.backend.mahapro.model.BusinessUser;

public interface BusinessUserService {
    public BusinessUser login(String authorizationHeader) throws Exception;
    public BusinessUser register(BusinessUser businessUser) throws Exception;
    public BusinessUser getBusinessUserFromCode(String code);
    public void confirmEmailVerified(String authorizationHeader) throws Exception;
    public void activateBusinessUserFromCode(String email, String password, int businessUserId) throws Exception;
}
