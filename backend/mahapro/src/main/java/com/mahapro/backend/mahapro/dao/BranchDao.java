package com.mahapro.backend.mahapro.dao;

import java.util.List;

import org.locationtech.jts.geom.Point;

import com.mahapro.backend.mahapro.model.Business.Branch.Branch;

public interface BranchDao {
    List<Branch> findAll();

    List<Branch> findAllByBusinessId(int businessId);
    Branch findBranchById(int branchId);

    List<Branch> findBranchByLocation(Point location);
}
