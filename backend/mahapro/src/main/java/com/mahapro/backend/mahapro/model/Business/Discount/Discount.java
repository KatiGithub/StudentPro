package com.mahapro.backend.mahapro.model.Business.Discount;

import java.io.Serializable;
import java.util.List;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.Business.Branch.AllowedBranch;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.BonusDiscount;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.FixedAmountDiscount;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.PercentageDiscount;
import com.mahapro.backend.mahapro.model.Text.TextContent;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="discount")
@JsonSerialize
public class Discount implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="discount_id")
    private int id;

    @Column(name="is_online_or_instore")
    private Boolean isOnlineOrInStore;

    @Column(name="claims_per_user")
    private int claimsPerUser;

    @Column(name="minimum_spend")
    private int minimumSpend;

    @Column(name="link_online")
    private String linkOnline;

    @Column(name="expiry_date")
    private double expiryDate;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name="business_id", nullable = false)
    @OnDelete(action=OnDeleteAction.CASCADE)
    private Business business;

    // @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    // @JoinColumn(name = "discount_id")
    // private List<FixedAmountDiscount> fixedAmountDiscounts;

    // @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    // @JoinColumn(name="discount_id")
    // private List<PercentageDiscount> percentageDiscounts;

    // @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    // @JoinColumn(name="discount_id")
    // private List<BonusDiscount> bonusDiscounts;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="discount_title_text_id", referencedColumnName = "text_id")
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

    public int getMinimumSpend() {
        return this.minimumSpend;
    }

    public void setMinimumSpend(int minimumSpend) {
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

    // public List<FixedAmountDiscount> getFixedAmountDiscounts() {
    //     return this.fixedAmountDiscounts;
    // }

    // public void setFixedAmountDiscounts(List<FixedAmountDiscount> fixedAmountDiscounts) {
    //     this.fixedAmountDiscounts = fixedAmountDiscounts;
    // }

    // public List<PercentageDiscount> getPercentageDiscounts() {
    //     return this.percentageDiscounts;
    // }

    // public void setPercentageDiscounts(List<PercentageDiscount> percentageDiscounts) {
    //     this.percentageDiscounts = percentageDiscounts;
    // }

    // public List<BonusDiscount> getBonusDiscounts() {
    //     return this.bonusDiscounts;
    // }

    // public void setBonusDiscounts(List<BonusDiscount> bonusDiscounts) {
    //     this.bonusDiscounts = bonusDiscounts;
    // }

    public TextContent getDiscountTitle() {
        return this.discountTitle;
    }

    public void setDiscountTitle(TextContent discountTitle) {
        this.discountTitle = discountTitle;
    }

}
