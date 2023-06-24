package com.mahapro.backend.mahapro.model.Business;

import java.util.List;

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
@Table(name="business_type")
public class BusinessType {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="business_type_id")
    private int id;

    @Column(name="business_type_name")
    private String name;

    @OneToMany(fetch =FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name = "business.business_type_id")
    private List<Business> businesses;
}
