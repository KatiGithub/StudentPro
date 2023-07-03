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

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "university_id")
    private University university;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public University getUniversity() {
        return university;
    }

    public void setUniversity(University university) {
        this.university = university;
    }
}
