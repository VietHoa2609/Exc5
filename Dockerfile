# Tomcat 10.0.27 + JDK 17
FROM tomcat:10.0.27-jdk17-temurin

# Xoá app mẫu
RUN rm -rf /usr/local/tomcat/webapps/*

# Sửa server.xml:
# - HTTP Connector: nghe 0.0.0.0 và cổng lấy từ env ${PORT} (Render sẽ set)
# - Tắt shutdown port (8005) để khỏi warning
RUN sed -ri 's#<Connector port="8080"#<Connector address="0.0.0.0" port="${env.PORT}"#' /usr/local/tomcat/conf/server.xml \
 && sed -ri 's#Server port="8005"#Server port="-1"#' /usr/local/tomcat/conf/server.xml

# Deploy WAR làm ROOT (URL gốc = "/")
COPY WebMVC.war /usr/local/tomcat/webapps/ROOT.war

# Chạy Tomcat
CMD ["catalina.sh", "run"]
