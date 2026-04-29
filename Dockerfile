# --- ETAPA 1: Construcción (Build) ---
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app

COPY .mvn .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw
RUN ./mvnw -B dependency:go-offline

COPY src ./src
RUN ./mvnw -B clean package -DskipTests

# --- ETAPA 2: Ejecución (Runtime) ---
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

RUN addgroup -S norootgroup && adduser -S norootuser -G norootgroup

COPY --from=build /app/target/*.jar app.jar
RUN chown norootuser:norootgroup /app/app.jar

USER norootuser
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
