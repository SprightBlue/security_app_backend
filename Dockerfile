# --- ETAPA 1: Construcción (Build) ---
# Usamos una imagen de Maven que soporte Java 25
FROM maven:3.9.9-eclipse-temurin-25 AS build
WORKDIR /app

# Copiamos el archivo de configuración de Maven y descargamos dependencias
# Esto optimiza la caché de Docker para que no descargue todo cada vez que cambies el código
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos el código fuente y compilamos el proyecto
COPY src ./src
RUN mvn clean package -DskipTests

# --- ETAPA 2: Ejecución (Runtime) ---
# Usamos una imagen ligera de Java 25 (JRE) para correr la app
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

# Copiamos solo el archivo .jar generado en la etapa anterior
# Gracias al <finalName>app</finalName> en tu pom.xml, el archivo se llama app.jar
COPY --from=build /app/target/app.jar app.jar

# Configuración de red y ejecución
# Spring Boot usa el 8080 por defecto
EXPOSE 8080

# Comando para iniciar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]