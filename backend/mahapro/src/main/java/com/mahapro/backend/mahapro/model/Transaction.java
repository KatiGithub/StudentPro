package com.mahapro.backend.mahapro.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="transaction")
public class Transaction {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="transaction_id")
    private int id;

    @Column(name="discount_coupon_code")
    private String discountCouponCode;

    @Column(name="used_on")
    private double usedOn;
}
