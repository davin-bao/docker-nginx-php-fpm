

# docker-nginx-php7
A Nginx + PHP 7.0 (FPM) base container. 

### Services
All services are defined and managed using the phusion/baseimage methodology. Logs are output using syslog and can be accessed using ``docker logs {container}``.

* Nginx (lastest)
* PHP-FPM (7.0) (with Xdebug)
* Composer (PHP)

### Default Settings
The container sets up a www root folder in the following location:

``/home/www``

As a final task a demo index.php is copied to this location.

### Web Root
The following folder is specified as the default root web folder:

``/home/www``

Note that the ``/var/www/public`` is the root folder for serving PHP files for your web server.

### Example
``$ docker run -p 3306:3306 --name my_mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql``
``$ docker run -p 3306:3306 --name my_postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres``

This will create a my_mysql or my_postgres image based on official mysql or postgres docker image.

``docker run -p 80:80 -p 9000:9000 --name my_laravel -v ~/dev/laravel:/var/www --link my_mysql:mysqldb -d ttaranto/docker-nginx-php7``

This will create a docker image with name `my_laravel` linked to the MySQL container (my_mysql). Configue Laravel to connect to `mysqldb` host on .env file to access the database.

Now you can access your project on browser http://localhost

In the future to start the project again run:

``docker start my_mysql my_laravel``

To stop just run:
``docker stop my_laravel my_mysql``

### Build Folder (within repo)
Contains nginx config files (nginx.conf) as well the scripts to configure php-fpm nginx, also include setup.sh file that offloads tasks from the Dockerfile to reduce layers.

### Databases
This image supports [PostgreSQL](https://hub.docker.com/_/postgres/) and [MySQL](https://hub.docker.com/_/mysql/) and/or [MariaDB](https://hub.docker.com/_/mariadb/).

### Timezone
The machine is configured to user America/Sao_Paulo timezone. The Nginx configuration is ready to run a [Laravel](https://laravel.com/) app.
