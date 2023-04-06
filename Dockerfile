FROM maven:3.9-amazoncorretto-8 as builder
MAINTAINER HarveyBai <320312396@qq.com>

RUN pwd
RUN ls -al
WORKDIR /app
COPY src /app/src/
COPY pom.xml /app/.
RUN pwd
RUN ls -al

# 编译打包（jar包生成路径：/app/target）
RUN mvn package -Dmaven.test.skip=true


FROM openjdk:8-jre-alpine
MAINTAINER HarveyBai <320312396@qq.com>
WORKDIR /app
COPY --from=builder /app/target/demo-spring-boot-2-0.0.1-SNAPSHOT.jar .
# 运行main类
CMD java -jar demo-spring-boot-2-0.0.1-SNAPSHOT.jar