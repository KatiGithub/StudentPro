package com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="percentage_discount")
public class PercentageDiscount {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="percentage_discount_id")
    private int id;

    @Column(name="discount_percentage")
    private float discount_percentage;
}
