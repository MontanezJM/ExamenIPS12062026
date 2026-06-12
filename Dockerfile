FROM maven:3.9.9-eclipse-temurin-21
WORKDIR /app
COPY pom.xml .
RUN ls /app; sleep 2
RUN mvn dependency:go-offline -B
COPY ./src ./src
RUN ls /app; sleep 2
COPY ./data ./data
RUN mvn package -DskipTests
ENV APP_DATA_PATH="./data"
EXPOSE 8080
CMD ["java", "-jar", "target/mundial2026-0.0.1-SNAPSHOT.jar"]