# syntax=docker/dockerfile:1
FROM openjdk:16-jdk-alpine as cache
RUN mkdir -p /app/cache_home
ENV GRADLE_USER_HOME /app/cache_home
WORKDIR /app/project_home
COPY gradle gradle
COPY build.gradle.kts settings.gradle.kts gradlew ./
RUN ./gradlew clean build -i --stacktrace || true

FROM openjdk:16-jdk-alpine as build
ENV GRADLE_USER_HOME /app/.gradle
COPY --from=cache /app/cache_home /app/.gradle
WORKDIR /app
COPY gradle gradle
COPY build.gradle.kts settings.gradle.kts gradlew ./
COPY src src
RUN ./gradlew bootJar -Dorg.gradle.logging.level=info

FROM openjdk:16-jdk-alpine
VOLUME /tmp
COPY --from=build app/build/libs/*.jar app.jar
ARG SPRING_PROFILE
ENV SPRING_PROFILES_ACTIVE=${SPRING_PROFILE}
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
