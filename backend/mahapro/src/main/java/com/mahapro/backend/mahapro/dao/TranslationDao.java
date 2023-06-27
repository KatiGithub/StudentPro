package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Text.Translation;

public interface TranslationDao {
    List<Translation> findAll();

    Translation findById();
    List<Translation> findByTextContentId(int textContentId);
    List<Translation> findByLanguageId(int languageId);

    Translation findByLanguageIdAndTextContentId(int textContentId, int languageId);
}
