FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy Maven files first (better caching)
COPY pom.xml .
COPY src ./src

# Build WAR
RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk17

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from build stage
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/javaapp.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
