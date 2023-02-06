FROM openjdk:8
LABEL "maintainer"="pk12@simplilearn.net"
ADD target/devops-integration.jar devops-integration.jar
ENTRYPOINT [ "java","-jar","/devops-integration.jar" ]