package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.BusinessType;

public interface BusinessTypeDao {
    List<BusinessType> findAll();

    BusinessType findById(int businessTypeId);
}
