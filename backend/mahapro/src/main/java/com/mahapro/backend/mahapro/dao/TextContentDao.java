package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Text.TextContent;

public interface TextContentDao {
    List<TextContent> findAll();
    TextContent findById(int textContentId);
}
