FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app
COPY . ./
RUN mvn clean
RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine3.9
WORKDIR /app
COPY --from=build-env /app/target/spring-boot-cassandra-0.0.1-SNAPSHOT.jar ./spring-boot.jar
CMD ["java", "-jar", "/app/spring-boot.jar"]
