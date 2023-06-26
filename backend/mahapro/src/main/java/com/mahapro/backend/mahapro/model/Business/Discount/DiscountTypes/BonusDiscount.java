package com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="bonus_discount")
public class BonusDiscount {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="bonus_discount_id")
    private int id;
}
