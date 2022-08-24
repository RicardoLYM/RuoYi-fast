#FROM java:11
FROM openjdk:11
MAINTAINER LuYeMing
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
EXPOSE 80
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
ENTRYPOINT ["nohup","java","-jar","/app.jar", "/app.jar", "--spring.profiles.active=prod", "&"]
