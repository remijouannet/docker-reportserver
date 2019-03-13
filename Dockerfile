# Dockerfile for reportserver 3.0

FROM centos:7

MAINTAINER Rémi Jouannet "remijouannet@gmail.com"

RUN yum -y update
RUN yum -y install unzip mysql java-1.8.0-openjdk

WORKDIR /app
RUN useradd -d /app -s /bin/false tomcat
ADD http://downloads.sourceforge.net/project/dw-rs/bin/3.0/RS3.0.6-6006-2019-03-08-13-21-38-reportserver-ce.zip /app/reportserver.zip
#ADD RS3.0.6-6006-2019-03-08-13-21-38-reportserver-ee.zip /app/reportserver.zip
ADD http://apache.crihan.fr/dist/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz /app/tomcat.tar.gz
COPY ./run.sh /app
RUN tar xvf /app/tomcat.tar.gz
RUN unzip /app/reportserver.zip -d /app/apache-tomcat-8.5.38/webapps/reportserver
RUN chmod u+x ./run.sh
RUN chown -R tomcat:tomcat /app

EXPOSE 8080

CMD /app/run.sh
