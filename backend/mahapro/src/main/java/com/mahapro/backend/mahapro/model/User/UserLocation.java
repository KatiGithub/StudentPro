package com.mahapro.backend.mahapro.model.User;

import org.locationtech.jts.geom.Point;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="user_location")
public class UserLocation {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="user_location_id")
    private int id;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name="time_received")
    private double timeReceived;

    @Column(name = "location")
    private Point location;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getTimeReceived() {
        return timeReceived;
    }

    public void setTimeReceived(double timeReceived) {
        this.timeReceived = timeReceived;
    }

    public Point getLocation() {
        return location;
    }

    public void setLocation(Point location) {
        this.location = location;
    }
}
