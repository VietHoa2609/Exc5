# === Tomcat 10.0.27 + JDK 17 ===
FROM tomcat:10.0.27-jdk17-temurin

# Xóa các app mẫu
RUN rm -rf /usr/local/tomcat/webapps/*

# Render bắt ứng dụng lắng nghe trên $PORT -> sửa server.xml để dùng biến môi trường
RUN sed -ri 's/port="8080"/port="${env.PORT}"/' /usr/local/tomcat/conf/server.xml

# Copy WAR và đặt làm ROOT.war (để context-path = "/")
# Nếu bạn muốn giữ context /WebMVC thì đổi tên file ở dòng này thành WebMVC.war
COPY WebMVC.war /usr/local/tomcat/webapps/WebMVC.war

# (Expose không bắt buộc trên Render)
EXPOSE 8080

CMD ["catalina.sh", "run"]
