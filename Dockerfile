FROM devilbox/php-fpm:8.2-work

# Install dependencies for Nginx and phpMyAdmin
RUN apt-get update && \
    apt-get install -y nginx wget unzip curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install phpMyAdmin
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O /tmp/phpmyadmin.zip && \
    unzip /tmp/phpmyadmin.zip -d /usr/share/ && \
    mv /usr/share/phpMyAdmin-* /var/www/html/phpmyadmin && \
    rm /tmp/phpmyadmin.zip && \
    chown -R 1000:1000 /var/www/html/phpmyadmin

# Install NVM and Node.js (e.g., latest LTS)
ENV NVM_DIR=/root/.nvm

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm use --lts && \
    nvm alias default 'lts/*'

# Load nvm in bash sessions
COPY ./docker/.bashrc /root/.bashrc

CMD ["sh", "-c", "service nginx start && php-fpm"]