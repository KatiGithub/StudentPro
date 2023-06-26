package com.mahapro.backend.mahapro.model.Business.Post;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="post")
public class Post {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "post_id")
    private int id;

    @Column(name="post_datetime")
    private double datetime;
}
