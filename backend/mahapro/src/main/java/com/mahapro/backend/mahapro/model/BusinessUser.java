package com.mahapro.backend.mahapro.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mahapro.backend.mahapro.model.Business.Business;
import jakarta.persistence.*;

@Entity
@Table(name = "business_user")
public class BusinessUser {

    @Id
    @Column(name = "business_user_id")
    private Integer businessUserId;

    @Column(name = "firebase_user_id")
    private String firebaseUserId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "can_claim_coupon")
    private Boolean canClaimCoupon;

    @Column(name = "can_edit_discount")
    private Boolean canEditDiscount;

    @Column(name = "can_edit_business_user")
    private Boolean canEditBusinessUser;

    @Column(name = "can_edit_business_info")
    private Boolean canEditBusinessinfo;

    @Column(name = "can_edit_admin")
    private Boolean canEditAdmin;

    @Column(name = "email")
    private String email;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "business_id", referencedColumnName = "business_id")
    private Business business;

    public Integer getBusinessUserId() {
        return businessUserId;
    }

    public void setBusinessUserId(Integer businessUserId) {
        this.businessUserId = businessUserId;
    }

    public String getFirebaseUserId() {
        return firebaseUserId;
    }

    public void setFirebaseUserId(String firebaseUserId) {
        this.firebaseUserId = firebaseUserId;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Boolean getCanClaimCoupon() {
        return canClaimCoupon;
    }

    public void setCanClaimCoupon(Boolean canClaimCoupon) {
        this.canClaimCoupon = canClaimCoupon;
    }

    public Boolean getCanEditDiscount() {
        return canEditDiscount;
    }

    public void setCanEditDiscount(Boolean canEditDiscount) {
        this.canEditDiscount = canEditDiscount;
    }

    public Boolean getCanEditBusinessUser() {
        return canEditBusinessUser;
    }

    public void setCanEditBusinessUser(Boolean canEditBusinessUser) {
        this.canEditBusinessUser = canEditBusinessUser;
    }

    public Boolean getCanEditBusinessinfo() {
        return canEditBusinessinfo;
    }

    public void setCanEditBusinessinfo(Boolean canEditBusinessinfo) {
        this.canEditBusinessinfo = canEditBusinessinfo;
    }

    public Boolean getCanEditAdmin() {
        return canEditAdmin;
    }

    public void setCanEditAdmin(Boolean canEditAdmin) {
        this.canEditAdmin = canEditAdmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
