# Security App - Backend 

Backend de detección de estafas y gestión de seguridad. Arquitectura escalable en capas con Spring Boot y PostgreSQL.

## 🚀 Stack Tecnológico

| Tecnología | Versión |
|:---|:---|
| Java | 25 (OpenJDK) |
| Spring Boot | 4.0.6 |
| PostgreSQL | 17 |
| Maven | 3.9+ |
| ORM | Spring Data JPA / Hibernate |

---

## 📁 Estructura del Proyecto

```
src/main/java/com/group_nine/security_app_backend/
├── controller/          # Endpoints REST
├── service/             # Lógica de negocio
├── repository/          # Acceso a datos (JPA)
├── model/               # Entidades JPA
├── dto/                 # Objetos de transferencia
└── config/              # Configuraciones

src/test/java/com/group_nine/security_app_backend/
├── controller/          # Tests de endpoints
├── service/             # Tests de lógica de negocio
└── repository/          # Tests de datos
