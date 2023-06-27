package com.mahapro.backend.mahapro.model.Business.Discount;

import java.io.Serializable;

import com.mahapro.backend.mahapro.model.Text.TextContent;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="discount_type")
public class DiscountType implements Serializable {
    @Id
    @Column(name="discount_type_id")
    private String id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "discount_type_name_id", referencedColumnName = "text_id")
    private TextContent discountTypeName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public TextContent getDiscountTypeName() {
        return discountTypeName;
    }

    public void setDiscountTypeName(TextContent discountTypeName) {
        this.discountTypeName = discountTypeName;
    }

    
}
