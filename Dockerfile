# Fetch the Java
#FROM openjdk:17-alpine
# Expose port 8080
#EXPOSE 8080
# set a docker volume if you want
#VOLUME /backend_volume
# Add the jar file
#ADD /target/*.jar docker-test-0.0.1-SNAPSHOT.jar
# Start the application
#ENTRYPOINT ["java", "-jar", "/docker-test-0.0.1-SNAPSHOT.jar"]

FROM maven:3.9.4-eclipse-temurin-17-alpine AS build
RUN mkdir-p/app
WORKDIR /app
COPY pom.xml /app
COPY src /app/src
RUN mvn -B package --file pom.xml -DskipTests

FROM eclipse-temurin:17-jdk-alpine
EXPOSE 8080
COPY --from=build /app/target/*jar docker-test-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","docker-test-0.0.1-SNAPSHOT.jar"]
