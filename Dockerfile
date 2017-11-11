FROM ubuntu
RUN apt-get update && apt-get -y upgrade && apt-get install --no-install-recommends -y apache2

EXPOSE 80
RUN a2enmod rewrite
RUN a2enmod proxy_fcgi

RUN rm /var/www/html/index.html
RUN rm /etc/apache2/sites-enabled/000-default.conf

COPY index.php /var/www/html/index.php
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN chmod 777 -R /var/log/apache2

CMD /usr/sbin/apache2ctl -D FOREGROUND
