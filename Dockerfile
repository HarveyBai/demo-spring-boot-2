FROM maven:3.9-amazoncorretto-8 as builder
MAINTAINER HarveyBai <320312396@qq.com>

COPY src .
COPY pom.xml .

# ��������jar������·����/app/target��
RUN mvn package -Dmaven.test.skip=true


FROM openjdk:8-jre-alpine
MAINTAINER HarveyBai <320312396@qq.com>
WORKDIR /app
COPY --from=builder /app/target/demo-spring-boot-2-0.0.1-SNAPSHOT.jar .
# ����main��
CMD java -jar demo-spring-boot-2-0.0.1-SNAPSHOT.jar