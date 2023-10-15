FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install zulu21.28.85-ca-jdk21.0.0-win_x64 -y

COPY . .

RUN apt-get install maven -y
RUN mvn clean install

EXPOSE 8080

COPY --from=build /target/todolist-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]


