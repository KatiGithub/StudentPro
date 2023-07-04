package com.mahapro.backend.mahapro.model.Business.Discount;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.Text.TextContent;
import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.io.Serializable;

@Entity
@Table(name = "discount")
public class Discount implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "discount_id")
    private int id;

    @Column(name = "is_online")
    private Boolean isOnlineOrInStore;

    @Column(name = "claims_per_user")
    private int claimsPerUser;

    @Column(name = "minimum_spend")
    private Integer minimumSpend;

    @Column(name = "link_online")
    private String linkOnline;

    @Column(name = "expiry_date")
    private double expiryDate;

    @Column(name = "is_percentage")
    private Boolean isPercentage;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "business_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Business business;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "discount_title_text_id", referencedColumnName = "text_id")
    private TextContent discountTitle;


    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Boolean isIsOnlineOrInStore() {
        return this.isOnlineOrInStore;
    }

    public Boolean getIsOnlineOrInStore() {
        return this.isOnlineOrInStore;
    }

    public void setIsOnlineOrInStore(Boolean isOnlineOrInStore) {
        this.isOnlineOrInStore = isOnlineOrInStore;
    }

    public int getClaimsPerUser() {
        return this.claimsPerUser;
    }

    public void setClaimsPerUser(int claimsPerUser) {
        this.claimsPerUser = claimsPerUser;
    }

    public Integer getMinimumSpend() {
        return this.minimumSpend;
    }

    public void setMinimumSpend(Integer minimumSpend) {
        this.minimumSpend = minimumSpend;
    }

    public String getLinkOnline() {
        return this.linkOnline;
    }

    public void setLinkOnline(String linkOnline) {
        this.linkOnline = linkOnline;
    }

    public double getExpiryDate() {
        return this.expiryDate;
    }

    public void setExpiryDate(double expiryDate) {
        this.expiryDate = expiryDate;
    }

    public Business getBusiness() {
        return this.business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public TextContent getDiscountTitle() {
        return this.discountTitle;
    }

    public void setDiscountTitle(TextContent discountTitle) {
        this.discountTitle = discountTitle;
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

    public Boolean isPercentage() {
        return isPercentage;
    }

    public void setPercentage(Boolean percentage) {
        isPercentage = percentage;
    }
}
