package com.group_nine.security_app_backend.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    private static final String MESSAGE = "Hola mundo";

    @GetMapping(value = {"/", "/health"}, produces = MediaType.TEXT_PLAIN_VALUE)
    public String hello() {
        return MESSAGE;
    }
}
