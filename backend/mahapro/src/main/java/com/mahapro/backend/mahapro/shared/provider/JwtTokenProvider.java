package com.mahapro.backend.mahapro.shared.provider;

public class JwtTokenProvider {
    public static String getToken(String bearerHeader) throws Exception {
        try {
            if(!bearerHeader.startsWith("Bearer ")) {
                throw new Exception();
            }

            return bearerHeader.substring(7, bearerHeader.length()-1);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
