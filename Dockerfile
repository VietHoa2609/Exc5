# Sử dụng Tomcat chính thức
FROM tomcat:10-jdk17/21

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR (nhớ đổi đúng tên file WAR đã build ra)
COPY WebMVC.war /usr/local/tomcat/webapps/ROOT.war

# Expose cổng
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
