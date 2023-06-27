package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.University.University;

public interface UniversityDao {
    List<University> findAll();

    University findById(int universityId);
    University findByName(String universityName);
    List<University> findByCountry(String country);
}