FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B -DskipTests package

FROM amazoncorretto:17
WORKDIR /app

# Copy built WAR from builder stage
COPY --from=build /app/target/ProjectEplatform-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.war"]