

FROM tomcat:10.0.27-jdk17-corretto
RUN rm -rf /usr/local/tomcat/webapps/* //xóa mặc định của tomcat
COPY baitapwebmvc.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
