# docker-reportserver

* Configure reportserver directly in the docker-compose.yml

```
MYSQL_DATABASE: reportserver #database for reportserver
MYSQL_USER: reportserver #user the database
MYSQL_PASSWORD: 641949548825f1f8c51d5f547ab88faa #password for reportserver


MYSQL_DATABASE: reportserver #use the same as above
MYSQL_USER: reportserver #use the same as above
MYSQL_PASSWORD: 641949548825f1f8c51d5f547ab88faa #use the same as above
```


```
mysql:
    image: mysql:5.7
    environment:
        MYSQL_DATABASE: reportserver
        MYSQL_USER: reportserver
        MYSQL_PASSWORD: 641949548825f1f8c51d5f547ab88faa
        MYSQL_RANDOM_ROOT_PASSWORD : 'true'
    volumes:
        - ./volume/mysql:/var/lib/mysql
reportserver:
    build: .
    environment:
        MYSQL_DATABASE: reportserver
        MYSQL_USER: reportserver
        MYSQL_PASSWORD: 641949548825f1f8c51d5f547ab88faa
    ports:
        - "8080:8080"
    links:
        - mysql
```

* three commands ;)

```
git clone https://github.com/remijouannet/docker-reportserver.git
cd docker-reportserver
docker-compose up
```

access the web ui with the following link :
* http://localhost:8080/reportserver
* login per default : root / root
