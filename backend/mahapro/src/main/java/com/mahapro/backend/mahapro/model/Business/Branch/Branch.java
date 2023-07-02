package com.mahapro.backend.mahapro.model.Business.Branch;

import java.io.Serializable;

import com.mahapro.backend.mahapro.model.Text.TextContent;
import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.locationtech.jts.geom.Point;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.shared.deserializer.LocationDeserializer;
import com.mahapro.backend.mahapro.shared.serializer.LocationSerializer;

@Entity
@Table(name = "branch")
@JsonSerialize
public class Branch implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "branch_id")
    private int id;

    @Column(name = "location")
    @JsonSerialize(using = LocationSerializer.class)
    @JsonDeserialize(using = LocationDeserializer.class)
    private Point location;

    @Column(name = "phone_number")
    private String phoneNumber;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "business_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Business business;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "branch_name_text_id", referencedColumnName = "text_id")
    private TextContent branchName;

    public TextContent getBranchName() {
        return branchName;
    }

    public void setBranchName(TextContent branchName) {
        this.branchName = branchName;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Point getLocation() {
        return this.location;
    }

    public void setLocation(Point location) {
        this.location = location;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Business getBusiness() {
        return this.business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

}
