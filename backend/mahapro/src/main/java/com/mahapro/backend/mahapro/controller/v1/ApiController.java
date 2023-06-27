package com.mahapro.backend.mahapro.controller.v1;

import org.springframework.core.annotation.AliasFor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/api/v1")
public @interface ApiController {
    @AliasFor(annotation = Component.class)
    String value() default "";
}
