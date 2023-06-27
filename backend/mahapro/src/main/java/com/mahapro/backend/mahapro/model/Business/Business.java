package com.mahapro.backend.mahapro.model.Business;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mahapro.backend.mahapro.model.Business.Branch.Branch;
import com.mahapro.backend.mahapro.model.Business.Discount.Discount;
import com.mahapro.backend.mahapro.model.Text.TextContent;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="business")
@JsonSerialize
public class Business implements Serializable{
    
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

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "business_info_text_id", referencedColumnName = "text_id")
    private TextContent businessInfo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public TextContent getBusinessInfo() {
        return businessInfo;
    }

    public void setBusinessInfo(TextContent businessInfo) {
        this.businessInfo = businessInfo;
    }

    
}
