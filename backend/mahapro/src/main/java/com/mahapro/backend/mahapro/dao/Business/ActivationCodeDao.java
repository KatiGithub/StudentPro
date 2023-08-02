package com.mahapro.backend.mahapro.dao.Business;

import com.mahapro.backend.mahapro.model.BusinessUser;

public interface ActivationCodeDao {
    public BusinessUser getBusinessUserFromActivationCode(String code);
    public void deleteAllCodeForBusinessUser(int businessUserId);
    public void createCodeForBusinessUser(BusinessUser businessUser);
    public String getLatestCodeForBusinessUser(BusinessUser businessUser);
}
