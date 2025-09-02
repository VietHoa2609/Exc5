# Tomcat 10.0.x + JDK 17
FROM tomcat:10.0.27-jdk17-temurin

# Xóa apps mẫu
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR của bạn (đặt ROOT để URL gốc = "/")
COPY WebMVC.war /usr/local/tomcat/webapps/ROOT.war

# Khi container start:
# - đổi Connector 8080 -> $PORT và bind 0.0.0.0
# - tắt shutdown port 8005 (đặt -1) để khỏi log warning
CMD sh -c '\
  sed -ri "s#<Connector port=\\"8080\\"#<Connector address=\\"0.0.0.0\\" port=\\"${PORT}\\"#" /usr/local/tomcat/conf/server.xml && \
  sed -ri "s#Server port=\\"8005\\"#Server port=\\"-1\\"#" /usr/local/tomcat/conf/server.xml && \
  catalina.sh run'
