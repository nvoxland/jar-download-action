FROM maven:3.8.6-eclipse-temurin-17-focal

COPY pom.xml /tmp/pom.xml
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:go-offline

COPY builder.pom.xml /builder.pom.xml
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]