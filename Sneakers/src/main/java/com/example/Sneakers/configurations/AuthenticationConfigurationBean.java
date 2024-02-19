package com.example.Sneakers.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;

@Configuration
public class AuthenticationConfigurationBean {
    @Bean
    public AuthenticationConfiguration authenticationConfiguration() throws Exception {
        return new AuthenticationConfiguration();
    }
}