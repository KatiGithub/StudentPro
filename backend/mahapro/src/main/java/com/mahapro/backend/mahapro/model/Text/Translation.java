package com.mahapro.backend.mahapro.model.Text;

import jakarta.persistence.*;

@Entity
@Table(name="translation")
public class Translation {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name = "translation")
    private String translation;
}
