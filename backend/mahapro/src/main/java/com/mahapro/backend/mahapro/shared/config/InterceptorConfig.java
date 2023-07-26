package com.mahapro.backend.mahapro.shared.config;

import com.mahapro.backend.mahapro.shared.filter.BusinessAuthInterceptor;
import com.mahapro.backend.mahapro.shared.filter.UserAuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private UserAuthInterceptor userAuthInterceptor;

    @Autowired
    private BusinessAuthInterceptor businessAuthInterceptor;

    private List<String> userAuthInterceptorExcludePatterns = new ArrayList<>() {{
        add("/user/register");
        add("/user/login");
        add("/business/*");
    }};

    private List<String> businessAuthInterceptorIncludePatterns = new ArrayList<>() {{
        add("/business/*");
    }};

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(userAuthInterceptor).excludePathPatterns(this.userAuthInterceptorExcludePatterns);
        registry.addInterceptor(businessAuthInterceptor).addPathPatterns(this.businessAuthInterceptorIncludePatterns);
    }
}