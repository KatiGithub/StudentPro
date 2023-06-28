package com.mahapro.backend.mahapro.model.University;

import jakarta.persistence.*;

@Entity
@Table(name = "university_domain")
public class UniversityDomain {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "university_domain_id")
    private int id;

    @Column(name = "domain")
    private String domain;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "university_id")
    private University university;
}
