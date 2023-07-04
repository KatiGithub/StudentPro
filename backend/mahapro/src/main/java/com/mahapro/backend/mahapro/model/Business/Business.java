package com.mahapro.backend.mahapro.model.Business;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mahapro.backend.mahapro.model.Text.TextContent;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "business")
@JsonSerialize
public class Business implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "business_id")
    private int id;


    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "business_name_text_id", referencedColumnName = "text_id")
    private TextContent name;

    @Column(name = "email")
    private String email;

    @Column(name = "contact_name")
    @JsonIgnore
    private String contactName;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "business_type_id")
    private BusinessType businessType;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "business_info_text_id", referencedColumnName = "text_id")
    private TextContent businessInfo;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "business_slogan_text_id", referencedColumnName = "text_id")
    private TextContent businessSlogan;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TextContent getName() {
        return name;
    }

    public void setName(TextContent name) {
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


    public TextContent getBusinessSlogan() {
        return businessSlogan;
    }

    public void setBusinessSlogan(TextContent businessSlogan) {
        this.businessSlogan = businessSlogan;
    }

    public BusinessType getBusinessType() {
        return businessType;
    }

    public void setBusinessType(BusinessType businessType) {
        this.businessType = businessType;
    }

    @Override
    public String toString() {
        try {
            return new ObjectMapper().writeValueAsString(this);
        } catch (Exception f) {
            System.out.println(f.getMessage());
            return null;
        }
    }
}
