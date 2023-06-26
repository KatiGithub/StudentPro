package com.mahapro.backend.mahapro.model.Business.Discount;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.BonusDiscount;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.FixedAmountDiscount;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.PercentageDiscount;

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
@Table(name="discount")
public class Discount {

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

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name = "fixedamount_discount.discount_id")
    private List<FixedAmountDiscount> fixedAmountDiscounts;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name="percentage_discount.discount_id")
    private List<PercentageDiscount> percentageDiscounts;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name="bonus_discount.discount_id")
    private List<BonusDiscount> bonusDiscounts;
}
