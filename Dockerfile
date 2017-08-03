FROM davinbao/php-fpm:latest
MAINTAINER Davin Bao <davin.bao@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /home/www

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ wheezy nginx" >> /etc/apt/sources.list.d/nginx.list

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/archives/*.deb

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY start.sh /
RUN chmod +x /start.sh

COPY nginx.sh /bin/nginx.sh /
RUN chmod +x /bin/nginx.sh

COPY phpfpm.sh /bin/phpfpm.sh /
RUN chmod +x /bin/phpfpm.sh

VOLUME [$WORKDIR]

EXPOSE 443 80 9000

ENTRYPOINT ["/start.sh"]