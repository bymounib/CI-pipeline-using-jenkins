# Utilise une image de base avec Java 11 pré-installé
FROM openjdk:17

EXPOSE 8080

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ONBUILD ADD . /usr/src/app
ONBUILD RUN mvn install
ONBUILD ADD /usr/src/app/target/demo.jar app.jar

CMD ["java","-jar","/app.jar"]
