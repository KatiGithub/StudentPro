package com.mahapro.backend.mahapro.model.Text;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name="language")
public class Language {

    @Id
    @Column(name="language_id")
    private short id;

    @Column(name="language_code")
    private String languageCode;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name="language_id")
    private List<Translation> translations;
}
