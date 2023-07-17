package com.mahapro.backend.mahapro.dao;

import com.mahapro.backend.mahapro.model.BusinessUser;

import java.util.List;

public interface BusinessUserDao {
    public BusinessUser saveUser(String businessUserId, String firebaseUserId, int businessId, int roleId);
    public List<BusinessUser> getBusinessUserByBusinessId(int businessId);
    public void deleteUser(int userToDeleteId);
    public void changeUserPermission(int businessUserId, int roleId);
    public  BusinessUser getBusinessUserByFirebaseUserId(String firebaseUserId);
}
