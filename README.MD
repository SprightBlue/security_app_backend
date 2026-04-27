# Security App - Backend 🛡️

Este proyecto es el núcleo de procesamiento para la detección de estafas y gestión de seguridad. Está diseñado para ser escalable, seguro y fácil de configurar para todo el equipo de desarrollo.

## 🚀 Tecnologías y Versiones
* **Java:** 25 (OpenJDK)
* **Spring Boot:** 4.0.6
* **Base de Datos:** PostgreSQL
* **Gestión de Dependencias:** Maven
* **ORM:** Spring Data JPA / Hibernate

---

## 🛠️ Configuración del Entorno Local

Para que el proyecto funcione correctamente en tu máquina, sin dependender de una conexion a Supabase, sigue estos pasos obligatorios de configuración de infraestructura.

### 1. Variables de Entorno
Por motivos de seguridad, el archivo `application.yml` no contiene credenciales. Debes configurar las siguientes variables de entorno en tu IDE (IntelliJ: *Edit Configurations -> Environment Variables*):

| Variable | Valor Sugerido (Local)                        | Descripción |
| :--- |:----------------------------------------------| :--- |
| `DB_URL` | `jdbc:postgresql://localhost:5432/tu_db_aqui` | URL de conexión a Postgres |
| `DB_USER` | `postgres`                                    | Tu usuario de PostgreSQL |
| `DB_PASSWORD` | `tu_password_aqui`                            | Tu contraseña de PostgreSQL |

### 2. Preparación de la Base de Datos
Antes de ejecutar la aplicación por primera vez, debes realizar lo siguiente:
1. Abre tu gestor de base de datos (DataGrip, pgAdmin, etc).
2. **Crea una nueva base de datos** manualmente. El nombre debe coincidir exactamente con el que pusiste en tu variable `DB_URL`.
3. **Importante:** No necesitas crear las tablas a mano. Gracias a la configuración `ddl-auto: update`, Spring Boot las creará automáticamente al detectar tus clases en el paquete `model`.

---

## 🏗️ Estructura de Paquetes
El proyecto utiliza una arquitectura en capas para separar responsabilidades:
* `controller`: Definición de endpoints REST.
* `service`: Lógica de negocio y procesamiento de datos.
* `repository`: Acceso a la base de datos mediante JPA.
* `model`: Entidades que representan las tablas en PostgreSQL.
* `dto`: Objetos para transferencia de datos entre el móvil y el servidor.