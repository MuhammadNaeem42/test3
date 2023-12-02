FROM php:8.2.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install necessary extensions and tools
RUN apt-get update && \
    apt-get install -y \
    libicu-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_mysql mysqli intl zip

# Install Docker CLI dependencies
RUN apt-get update && \
    apt-get install -y apt-utils apt-transport-https ca-certificates curl gnupg lsb-release && \
    rm -rf /var/lib/apt/lists/*

# Install Docker CLI
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Install vim and nano for editing
RUN apt-get install -y vim nano

# Copy necessary files
# COPY ./dockerphp/000-default.conf /etc/apache2/sites-available/
COPY ./dockerphp/php.ini /usr/local/etc/php/php.ini
COPY ./dockerphp/DBconn.php /var/www/html/include

# Enable necessary Apache modules
RUN a2enmod rewrite

# Create the data directory if it doesn't exist
RUN mkdir -p /data
