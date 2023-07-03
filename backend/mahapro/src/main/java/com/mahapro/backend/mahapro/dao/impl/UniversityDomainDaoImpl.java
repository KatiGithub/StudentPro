package com.mahapro.backend.mahapro.dao.impl;

import com.mahapro.backend.mahapro.dao.UniversityDomainDao;
import com.mahapro.backend.mahapro.model.University.UniversityDomain;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class UniversityDomainDaoImpl implements UniversityDomainDao {

    @Autowired
    EntityManager entityManager;

    @Override
    public List<UniversityDomain> findAll() {
        return null;
    }

    @Override
    public UniversityDomain findById(int universityDomainId) {
        return null;
    }

    @Override
    public List<UniversityDomain> findByUniversityId(int universityDomain) {
        return null;
    }

    @Override
    public UniversityDomain findByDomain(String domain) {
        Query query = entityManager.createNativeQuery("SELECT * FROM university_domain WHERE domain = :domain", UniversityDomain.class);
        query.setParameter("domain", domain);

        return (UniversityDomain) query.getSingleResult();
    }

    @Override
    public UniversityDomain findByEmailDomain(String domain) {
        return null;
    }
}
