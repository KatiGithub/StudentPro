package com.mahapro.backend.mahapro.model.University;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.*;

@Entity
@Table(name = "university")
public class University {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "university_id")
    private short id;

    @Column(name = "university_name")
    private String name;

    @Column(name = "university_country")
    private String country;

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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
