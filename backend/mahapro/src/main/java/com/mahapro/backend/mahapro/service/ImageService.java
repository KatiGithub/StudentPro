package com.mahapro.backend.mahapro.service;

import java.io.FileNotFoundException;
import java.io.InputStream;

public interface ImageService {
    public InputStream getImage(String route) throws FileNotFoundException;
}
