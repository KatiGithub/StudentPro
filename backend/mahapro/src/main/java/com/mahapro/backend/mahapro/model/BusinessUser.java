package com.mahapro.backend.mahapro.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mahapro.backend.mahapro.model.Business.Business;
import jakarta.persistence.*;

@Entity
@Table(name = "business_user")
public class BusinessUser {

    @Id
    @Column(name = "business_user_id")
    private String businessUserId;

    @Column(name = "firebase_user_id")
    private String firebaseUserId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id", referencedColumnName = "role_id")
    private Role role;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "business_id", referencedColumnName = "business_id")
    private Business business;

    public String getBusinessUserId() {
        return businessUserId;
    }

    public void setBusinessUserId(String businessUserId) {
        this.businessUserId = businessUserId;
    }

    public String getFirebaseUserId() {
        return firebaseUserId;
    }

    public void setFirebaseUserId(String firebaseUserId) {
        this.firebaseUserId = firebaseUserId;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    @Override
    public String toString() {
        try {
            return new ObjectMapper().writeValueAsString(this);
        } catch (Exception f) {
            System.out.println(f.getMessage());
            return null;
        }
    }
}
