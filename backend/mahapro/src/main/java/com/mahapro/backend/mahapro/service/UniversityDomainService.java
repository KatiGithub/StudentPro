package com.mahapro.backend.mahapro.service;

import com.mahapro.backend.mahapro.model.University.UniversityDomain;
import com.mahapro.backend.mahapro.shared.exception.UniversityNotFound;

public interface UniversityDomainService {
    UniversityDomain findByDomain(String domain) throws UniversityNotFound;
}
