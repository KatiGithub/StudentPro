package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.Business.Post.Post;

public interface PostDao {
    List<Post> findAll();

    Post findById(int postId);
    List<Post> findByBusinessId(int postId);
    // List<Post> findByDateTime(double datetime);
}
