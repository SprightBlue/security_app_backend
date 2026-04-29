package com.group_nine.security_app_backend.controller;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class HealthControllerTest {

    @Test
    void controllerReturnsPlainTextMessage() {
        HealthController controller = new HealthController();

        String response = controller.hello();

        assertEquals("Hola mundo", response);
    }
}
