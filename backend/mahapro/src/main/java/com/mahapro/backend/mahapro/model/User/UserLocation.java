package com.mahapro.backend.mahapro.model.User;

import org.locationtech.jts.geom.Point;

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
    @JoinColumn(name = "user.user_id")
    private User user;

    @Column(name="user_location", columnDefinition="geography(POINT, 4326)")
    private Point location;

    @Column(name="time_received")
    private double timeReceived;
}
