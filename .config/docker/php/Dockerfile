FROM php:8.3-fpm-alpine

# Set build arguments
ARG UID=1000
ARG GID=1000

# Set environment variables
ENV UID=${UID}
ENV GID=${GID}

# Create the working directory
RUN mkdir -p /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Copy Composer from the Composer image
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Remove the dialout group, if it exists (conflict with MacOS staff group)
RUN delgroup dialout || true

# Add the user group and user matching your host
RUN addgroup -g ${GID} --system mozrin
RUN adduser -G mozrin --system -D -s /bin/sh -u ${UID} mozrin

# Update PHP-FPM configuration to use the mozrin user and group
RUN sed -i "s/user = www-data/user = mozrin/g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i "s/group = www-data/group = mozrin/g" /usr/local/etc/php-fpm.d/www.conf \
    && echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

# Install necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install and enable Redis PHP extension
RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

# Change ownership of the working directory to the mozrin user
RUN chown -R ${UID}:${GID} /var/www/html

# Set the user to mozrin
USER mozrin

# Expose port 9000 and start PHP-FPM
EXPOSE 9000
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
