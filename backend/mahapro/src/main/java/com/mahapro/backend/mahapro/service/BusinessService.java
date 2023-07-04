package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.Business.Business;

import java.util.List;

public interface BusinessService {
    List<Business> findBusinessByRandom();
}
