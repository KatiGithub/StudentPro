package com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="fixedamount_discount")
public class FixedAmountDiscount {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="fixedamount_discount_id")
    public int id;

    @Column(name="discount_amount")
    public float discount_amount;
}
