package com.mahapro.backend.mahapro.model.Text;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.Business.Discount.Discount;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountType;
import com.mahapro.backend.mahapro.model.Business.Discount.DiscountTypes.BonusDiscount;
import com.mahapro.backend.mahapro.model.Business.Post.Post;

import jakarta.persistence.*;

@Entity
@Table(name="text_content")
@JsonSerialize
public class TextContent implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="text_id")
    private int id;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name="text_id")
    private List<Translation> translations;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Translation> getTranslations() {
        return translations;
    }

    public void setTranslations(List<Translation> translations) {
        this.translations = translations;
    }

    
}
