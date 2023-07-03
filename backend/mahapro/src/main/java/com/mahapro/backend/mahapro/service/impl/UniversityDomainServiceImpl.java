package com.mahapro.backend.mahapro.service.impl;

import com.mahapro.backend.mahapro.dao.UniversityDomainDao;
import com.mahapro.backend.mahapro.model.University.UniversityDomain;
import com.mahapro.backend.mahapro.service.UniversityDomainService;
import com.mahapro.backend.mahapro.shared.exception.UniversityNotFound;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UniversityDomainServiceImpl implements UniversityDomainService {

    @Autowired
    UniversityDomainDao universityDomainDao;

    @Override
    public UniversityDomain findByDomain(String domain) throws UniversityNotFound {
        try {
            return universityDomainDao.findByDomain(domain);
        } catch (Exception e) {
            throw new UniversityNotFound();
        }
    }
}
