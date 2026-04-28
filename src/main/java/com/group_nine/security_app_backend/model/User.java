package com.group_nine.security_app_backend.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "users") // "user" es palabra reservada en Postgres, mejor usa "users"
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
}
