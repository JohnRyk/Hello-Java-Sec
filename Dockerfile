#FROM openjdk:8
FROM eclipse-temurin:8-jdk

VOLUME /tmp

COPY ./target/javasec-*.jar /app.jar

EXPOSE 8888

#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
#Integrate rasp agent
ENTRYPOINT ["java","-javaagent:/tmp/xxxagent/agent.jar","-Dxmirror.ip=x.x.x.x","-Dxmirror.port=9290","-Dxmirror.token=xxxx","-Dxmirror.projectname=xxxx","-Dxmirror.nodename=xxxx","-Dxmirror.mode=rasp","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

CMD ["--spring.profiles.active=docker"]
