package com.mahapro.backend.mahapro.dao.impl;

import java.util.List;

import org.locationtech.jts.geom.Point;
import org.springframework.beans.factory.annotation.Autowired;

import com.mahapro.backend.mahapro.dao.BranchDao;
import com.mahapro.backend.mahapro.model.Business.Branch.Branch;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

public class BranchDaoImpl implements BranchDao {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<Branch> findAll() {
        Query query = entityManager.createNativeQuery("SELECT * FROM branch", Branch.class);

        return (List<Branch>) query.getResultList();
    }

    @Override
    public List<Branch> findAllByBusinessId(int businessId) {
        Query query = entityManager.createNamedQuery("SELCT * FROM branch WHERE business_id = :businessId", Branch.class);

        query.setParameter("businesId", businessId);
        return (List<Branch>) query.getResultList();
    }

    @Override
    public Branch findBranchById(int branchId) {
        Query query = entityManager.createNativeQuery("SELECT * FROM branch WHERE branch_id = :branchId", Branch.class);
        query.setParameter("branchId", branchId);

        return (Branch) query.getResultList().get(0);
    }

    @Override
    public List<Branch> findBranchByLocation(Point location) {
        Query query = entityManager.createNativeQuery("SELECT * FROM list_branches_by_location(:longitude , :latitude)", Branch.class);
        query.setParameter("longitude", location.getX());
        query.setParameter("latitude", location.getY());

        return (List<Branch>) query.getResultList();
    }
}
