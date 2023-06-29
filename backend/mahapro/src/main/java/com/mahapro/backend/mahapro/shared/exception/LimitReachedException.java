package com.mahapro.backend.mahapro.shared.exception;

public class LimitReachedException extends Exception {
    public LimitReachedException(String message) {
        super(message);
    }
}
