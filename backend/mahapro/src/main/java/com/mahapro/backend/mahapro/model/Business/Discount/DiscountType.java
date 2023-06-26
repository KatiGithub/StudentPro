package com.mahapro.backend.mahapro.model.Business.Discount;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="discount_type")
public class DiscountType {
    @Id
    @Column(name="discount_type_id")
    private String id;
}
