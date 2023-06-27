package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Text.Language;

public interface LanguageDao {
    List<Language> findAll();

    Language findById(int languageId);
    Language findByLanguageCode(String languageCode);
}
