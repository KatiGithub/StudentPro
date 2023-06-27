package com.mahapro.backend.mahapro.dao;

import java.util.List;

import com.mahapro.backend.mahapro.model.User.UserLocation;

public interface UserLocationDao {
    List<UserLocation> findAll();

    List<UserLocation> findById(int userLocationId);
    List<UserLocation> findByUserId(int userId);
}
