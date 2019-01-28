FROM hmcts/cnp-java-base:openjdk-jre-8-slim-stretch-1.0

ENV APP am-api.jar
ENV APPLICATION_TOTAL_MEMORY 1024M
ENV APPLICATION_SIZE_ON_DISK_IN_MB 41
ENV JAVA_OPTS ""

COPY build/libs/$APP /opt/app/

EXPOSE 2703
