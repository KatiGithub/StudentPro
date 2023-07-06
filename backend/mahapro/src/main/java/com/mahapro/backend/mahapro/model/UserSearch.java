package com.mahapro.backend.mahapro.model;

import com.mahapro.backend.mahapro.model.Business.BusinessType;
import com.mahapro.backend.mahapro.model.User.User;
import jakarta.persistence.*;

@Entity
@Table(name = "user_search")
public class UserSearch {

    @Id
    @Column(name = "user_search_id")
    private int userSearchId;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User userId;

    @Column(name = "query")
    private String query;

    @Column(name = "longitude")
    private Double longitude;

    @Column(name = "latitude")
    private Double latitude;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "business_type_id")
    private BusinessType businessType;

    public int getUserSearchId() {
        return userSearchId;
    }

    public void setUserSearchId(int userSearchId) {
        this.userSearchId = userSearchId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public BusinessType getBusinessType() {
        return businessType;
    }

    public void setBusinessType(BusinessType businessType) {
        this.businessType = businessType;
    }
}
