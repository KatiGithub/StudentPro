package com.mahapro.backend.mahapro.model.Business;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Discount.Discount;

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
@Table(name="business")
public class Business {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="business_id")
    private int id;

    @Column(name="business_name")
    private String name;

    @Column(name="email")
    private String email;

    @Column(name="contact_name")
    private String contactName;

    @OneToMany(fetch=FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name="discount.discount_id")
    private List<Discount> discounts;
}
