package com.mahapro.backend.mahapro.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="favorite_retailer")
public class FavoriteRetailer {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "favorite_retailer_id")
    private int favoriteRetailer;
}
