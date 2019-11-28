FROM alpine:3.7

WORKDIR /opt/logs

COPY ["sources/", "/opt"]

RUN apk --update add openjdk8-jre && apk --update add lsof; \
    lsof -i tcp:8080; \
    mkdir -p /opt/SUNWappserver/conf; \
    chmod 777 /opt && chmod 777 /opt/logs; \
    tar xvzf /opt/apache-tomcat-9.0.27.tar.gz -C /opt/; \
    chmod 777 -R /opt/apache-tomcat-9.0.27 && chmod +x /opt/apache-tomcat-9.0.27/bin/catalina.sh; \
    rm /opt/apache-tomcat-9.0.27.tar.gz;

ENTRYPOINT ["/bin/sh","/opt/apache-tomcat-9.0.27/bin/startup.sh"]
