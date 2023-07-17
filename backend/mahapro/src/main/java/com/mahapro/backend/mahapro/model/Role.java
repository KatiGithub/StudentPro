package com.mahapro.backend.mahapro.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "role")
public class Role {

    @Id
    @Column(name = "role_id")
    private short roleId;

    @Column(name = "role_name")
    private String roleName;

    @Column(name = "can_claim_coupon")
    private boolean canClaimCoupon;

    @Column(name = "can_post_discount")
    private boolean canPostDiscount;

    @Column(name = "can_edit_discount")
    private boolean canEditDiscount;

    @Column(name = "can_edit_business_user")
    private boolean canEditBusinessUser;

    public short getRoleId() {
        return roleId;
    }

    public void setRoleId(short roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public boolean isCanClaimCoupon() {
        return canClaimCoupon;
    }

    public void setCanClaimCoupon(boolean canClaimCoupon) {
        this.canClaimCoupon = canClaimCoupon;
    }

    public boolean isCanPostDiscount() {
        return canPostDiscount;
    }

    public void setCanPostDiscount(boolean canPostDiscount) {
        this.canPostDiscount = canPostDiscount;
    }

    public boolean isCanEditDiscount() {
        return canEditDiscount;
    }

    public void setCanEditDiscount(boolean canEditDiscount) {
        this.canEditDiscount = canEditDiscount;
    }

    public boolean isCanEditBusinessUser() {
        return canEditBusinessUser;
    }

    public void setCanEditBusinessUser(boolean canEditBusinessUser) {
        this.canEditBusinessUser = canEditBusinessUser;
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
