FROM tomcat:8.0-alpine

LABEL maintainer="jacobmaldonado@hotmail.com"

ADD ./PlataformaVideos.war /usr/local/tomcat/webapps/
ADD ./mysql-connector-java-5.1.41-bin.jar /usr/local/tomcat/lib
ADD ./tomcat-users.xml $CATALINA_HOME/conf

EXPOSE 8080

CMD ["catalina.sh","run"]
