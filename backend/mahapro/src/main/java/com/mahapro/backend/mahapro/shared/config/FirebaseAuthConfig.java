package com.mahapro.backend.mahapro.shared.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;

@Configuration
public class FirebaseAuthConfig {
    @Value("classpath:service-account.json")
    Resource serviceAccount;

    @Bean
    FirebaseAuth firebaseAuth() throws Exception {
        FirebaseOptions firebaseOptions = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream()))
                .build();

        FirebaseApp firebaseApp = FirebaseApp.initializeApp(firebaseOptions);

        return FirebaseAuth.getInstance(firebaseApp);
    }
}
