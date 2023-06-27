package com.mahapro.backend.mahapro.model.Business.Post;

import java.io.Serializable;

import com.mahapro.backend.mahapro.model.Text.TextContent;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="post")
public class Post implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "post_id")
    private int id;

    @Column(name="post_datetime")
    private double datetime;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "post_content_text_id", referencedColumnName = "text_id")
    private TextContent postContentTextId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getDatetime() {
        return datetime;
    }

    public void setDatetime(double datetime) {
        this.datetime = datetime;
    }

    public TextContent getPostContentTextId() {
        return postContentTextId;
    }

    public void setPostContentTextId(TextContent postContentTextId) {
        this.postContentTextId = postContentTextId;
    }

    
}
