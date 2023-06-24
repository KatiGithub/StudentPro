package com.mahapro.backend.mahapro.model.University;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "university_domain")
public class UniversityDomain {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "university_domain_id")
    private int id;

    @Column(name = "domain")
    private String domain;
}
