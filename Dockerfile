# =====================================================
# STAGE 1 - BUILD JAVA WAR
# =====================================================
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy complete project
COPY . .

# Build WAR file
RUN mvn clean package -DskipTests

# Debug - verify WAR generated
RUN ls -ltr /app/target

# =====================================================
# STAGE 2 - TOMCAT DEPLOYMENT
# =====================================================
FROM tomcat:9.0-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy generated WAR into Tomcat
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/javaapp.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
