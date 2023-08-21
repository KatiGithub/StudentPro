package com.mahapro.backend.mahapro.dao.Business;

import com.mahapro.backend.mahapro.model.BusinessUser;

import java.util.List;

public interface BusinessUserDao {
    BusinessUser saveUser(BusinessUser businessUser);
    public List<BusinessUser> getBusinessUserByBusinessId(int businessId);
    public void deleteUser(int userToDeleteId);
    public void changeUserPermission(int businessUserId, int roleId);
    public  BusinessUser getBusinessUserById(int businessUserId);
    public BusinessUser getBusinessUserByFirebaseUserId(String firebaseUserId);
    public void activateBusinessCodeUser(String uid, int businessUserId);
    public void businessUserEmailVerified(int businessUserId);
}