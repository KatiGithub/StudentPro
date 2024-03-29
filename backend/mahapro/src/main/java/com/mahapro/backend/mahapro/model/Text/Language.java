package com.mahapro.backend.mahapro.model.Text;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import jakarta.persistence.*;

@Entity
@Table(name="language")
@JsonSerialize
public class Language implements Serializable {

    @Id
    @Column(name="language_id")
    private short id;

    @Column(name="language_code")
    private String languageCode;

    public short getId() {
        return this.id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getLanguageCode() {
        return this.languageCode;
    }

    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }

}
