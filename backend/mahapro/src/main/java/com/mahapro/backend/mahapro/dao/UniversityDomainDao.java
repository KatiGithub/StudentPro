package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.University.UniversityDomain;

public interface UniversityDomainDao {
    List<UniversityDomain> findAll();

    UniversityDomain findById(int universityDomainId);
    List<UniversityDomain> findByUniversityId(int universityDomain);

    UniversityDomain findByDomain(String domain);
}
