package com.mahapro.backend.mahapro.model.Business.Branch;

import java.util.List;

import org.locationtech.jts.geom.Point;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="branch")
public class Branch {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="branch_id")
    private int id;

    @Column(name="location")
    private Point location;

    @Column(name="phone_number")
    private String phoneNumber;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id")
    private List<AllowedBranch> allowedBranches;
}
