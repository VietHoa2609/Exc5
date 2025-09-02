# Tomcat 10.0.x + JDK 17
FROM tomcat:10.0.27-jdk17-temurin

# Xoá webapps mẫu
RUN rm -rf /usr/local/tomcat/webapps/*

# Render cấp biến môi trường PORT -> Tomcat listen trên PORT đó
RUN sed -ri 's/port="8080"/port="${env.PORT}"/' /usr/local/tomcat/conf/server.xml

# Đặt WAR làm ROOT để URL gốc = "/"
COPY WebMVC.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
