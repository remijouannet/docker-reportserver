mysql -h mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D $MYSQL_DATABASE < /app/apache-tomcat-8.5.4/webapps/reportserver/ddl/reportserver-RS3.0.2-5855-schema-MySQL5_CREATE.sql

cat > /app/apache-tomcat-8.5.4/webapps/reportserver/WEB-INF/classes/persistence.properties <<HERE
hibernate.connection.username=$MYSQL_USER
hibernate.connection.password=$MYSQL_PASSWORD
hibernate.dialect=net.datenwerke.rs.utils.hibernate.MySQL5Dialect
hibernate.connection.driver_class=com.mysql.jdbc.Driver
hibernate.connection.url=jdbc:mysql://mysql:3306/$MYSQL_DATABASE?useSSL=false
HERE

cd /app/apache-tomcat-8.5.4/bin
su -s /bin/bash tomcat -c './catalina.sh run'
