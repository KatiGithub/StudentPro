package com.mahapro.backend.mahapro.service.impl;

import com.mahapro.backend.mahapro.dao.BusinessDao;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusinessServiceImpl implements BusinessService {

    @Autowired
    BusinessDao businessDao;

    @Override
    public List<Business> findBusinessByRandom() {
        return businessDao.findByRandom();
    }
}
