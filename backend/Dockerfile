FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
VOLUME /root/.m2
WORKDIR /build/
COPY pom.xml /build/
RUN mvn dependency:go-offline
COPY src /build/src/
RUN mvn package -Djar.finalName=app.jar

FROM openjdk:8-jre-alpine
RUN apk add bash
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/*.jar /app/
COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh
RUN mv *.jar app.jar

ENTRYPOINT java -jar app.jar
