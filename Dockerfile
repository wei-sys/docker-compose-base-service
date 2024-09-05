FROM devilbox/php-fpm:8.2-mods

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# install phpmyadmin
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O /tmp/phpmyadmin.zip && \
    unzip /tmp/phpmyadmin.zip -d /usr/share/ && \
    mv /usr/share/phpMyAdmin-* /var/www/html/phpmyadmin && \
    rm /tmp/phpmyadmin.zip && \
    chown -R 1000:1000 /var/www/html/phpmyadmin && \
    rm -rf /var/lib/apt/lists/*