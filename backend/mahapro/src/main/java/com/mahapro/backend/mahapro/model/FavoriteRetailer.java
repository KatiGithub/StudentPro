package com.mahapro.backend.mahapro.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mahapro.backend.mahapro.model.Business.Business;
import com.mahapro.backend.mahapro.model.User.User;
import jakarta.persistence.*;

@Entity
@Table(name="favorite_retailer")
public class FavoriteRetailer {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "favorite_retailer_id")
    private int favoriteRetailer;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "business_id")
    private Business business;

    public int getFavoriteRetailer() {
        return favoriteRetailer;
    }

    public void setFavoriteRetailer(int favoriteRetailer) {
        this.favoriteRetailer = favoriteRetailer;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
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
