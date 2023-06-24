package com.mahapro.backend.mahapro.model.University;

import java.util.List;

import com.mahapro.backend.mahapro.model.User.User;

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
@Table(name = "university")
public class University {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "university_id")
    private int id;

    @Column(name = "university_name")
    private String name;

    @Column(name = "university_country")
    private int country;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name="university_domain.university_id")
    private List<UniversityDomain> domains;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name = "user.university_id")
    private List<User> users;
}
