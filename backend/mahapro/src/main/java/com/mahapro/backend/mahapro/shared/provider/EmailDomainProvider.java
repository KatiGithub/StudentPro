package com.mahapro.backend.mahapro.shared.provider;

public class EmailDomainProvider {
    public static String getEmailDomain(String email) {
        return email.substring(email.indexOf("@")+1);
    }
}
