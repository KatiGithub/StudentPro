package com.mahapro.backend.mahapro.model.Business.Branch;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="allowed_branch")
public class AllowedBranch {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "allowed_branches_id")
    private int id;
}
