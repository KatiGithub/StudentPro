package com.mahapro.backend.mahapro.model.User;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "\"user\"")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private int userId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "personal_email")
    private String personalEmail;

    @Column(name = "school_email")
    private String schoolEmail;

    @Column(name = "date_of_birth")
    private double dateOfBirth;

    @Column(name = "firebase_user_id")
    private String firebaseUserId;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<UserLocation> userLocations;
}