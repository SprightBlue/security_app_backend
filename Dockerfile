# --- ETAPA 1: Construcción (Build) ---
# Usamos Java 21 para compilar (que es compatible para generar bytecode de versiones superiores si se configura)
# O mejor aún, usamos la imagen base de Java 25 e instalamos Maven manualmente para asegurar compatibilidad total
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app

# Instalamos Maven manualmente en la imagen de Java 25
RUN apk add --no-cache maven

# Copiamos pom.xml y descargamos dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos código y compilamos
COPY src ./src
RUN mvn clean package -DskipTests

# --- ETAPA 2: Ejecución (Runtime) ---
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

# Copiamos el jar (asegúrate de tener <finalName>app</finalName> en tu pom.xml)
COPY --from=build /app/target/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
