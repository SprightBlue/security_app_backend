# Security App - Backend 🔐

Backend para detección de estafas y gestión de seguridad. El proyecto está construido con **Spring Boot** y utiliza **Supabase** (PostgreSQL) como base de datos. El backend se despliega en **Azure App Service** y la integración continua está configurada con **GitHub Actions**.

## 🚀 Stack tecnológico

| Tecnología | Versión |
|:---|:---:|
| Java | 25 (OpenJDK) |
| Spring Boot | 4.0.6 |
| PostgreSQL (Supabase) | 17 |
| Groq AI | API |
| Maven | 3.9+ |
| ORM | Spring Data JPA / Hibernate |

## 🌐 Despliegue

- Base de datos: Supabase
- Backend: Azure App Service
- CI/CD: GitHub Actions

## 📁 Estructura del proyecto

```text
src/main/java/com/group_nine/security_app_backend/
├── controller/   # Endpoints REST
├── service/      # Lógica de negocio
├── repository/   # Acceso a datos (JPA)
├── model/        # Entidades JPA
├── dto/          # Objetos de transferencia
└── config/       # Configuraciones

src/test/java/com/group_nine/security_app_backend/
├── controller/   # Tests de endpoints
├── service/      # Tests de lógica de negocio
└── repository/   # Tests de datos
```

## ⚙️ Perfiles de Spring Boot

La variable de entorno `SPRING_PROFILES_ACTIVE` define qué profile de Spring Boot se activa según el entorno.

| Entorno | Profile | Uso |
|:---|:---|:---|
| Local | `dev` | Desarrollo local con tu configuración de trabajo |
| GitHub Actions | `test` | Ejecución de tests automatizados |
| Azure App Service | `prod` | Despliegue en producción |

## ⚙️ Variables de entorno en Azure

Configura estas variables en **Azure App Service > Configuración > Variables de entorno**:

| Variable                 | Descripción                                                           |
|:-------------------------|:----------------------------------------------------------------------|
| `DB_URL`                 | URL de conexión a Supabase usando el Transaction Pooler (puerto 6543) |
| `DB_USER`                | Usuario del pooler de Supabase                                        |
| `DB_PASSWORD`            | Contraseña definida en Supabase                                       |
| `WEBSITES_PORT`          | Puerto interno del contenedor Spring Boot                             |
| `SPRING_PROFILES_ACTIVE` | Activa el perfil de producción en Azure App Service                   |
| `GROQ_API_KEY`           | Clave de API de Groq para autenticar las peticiones                   |
| `GROQ_MODEL_TEXT`        | Modelo para chat, lógica y análisis de texto                          |
| `GROQ_MODEL_VISION`      | Modelo para analizar archivos e imágenes                              |
| `GROQ_MODEL_AUDIO`       | Modelo para transcribir audio a texto                                 |

## 🚀 Publicación y despliegue continuo

1. Descarga el perfil de publicación desde el recurso de Azure App Service (opción "descargar perfil de publicación").
2. En Azure, habilita la implementación continua en el centro de implementación y copia la URL del webhook de despliegue.
3. Actualiza el workflow de GitHub Actions con el perfil de publicación y el url del webhook según corresponda.
