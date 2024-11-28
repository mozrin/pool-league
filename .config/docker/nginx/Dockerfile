FROM nginx:stable-alpine

ARG UID=1000
ARG GID=1000

ENV UID=${UID}
ENV GID=${GID}

# Remove the dialout group, if it exists (conflict with MacOS staff group)
RUN delgroup dialout || true

# Add the user group and user matching your host
RUN addgroup -g ${GID} --system mozrin
RUN adduser -G mozrin --system -D -s /bin/sh -u ${UID} mozrin

# Update Nginx configuration to use the mozrin user and group
RUN sed -i "s/user  nginx/user  mozrin/g" /etc/nginx/nginx.conf

# Add custom Nginx configuration
ADD ./default.conf /etc/nginx/conf.d/

# Create necessary directories and set ownership
RUN mkdir -p /var/www/html /var/cache/nginx /var/run/nginx /var/log/nginx /var/cache/nginx/client_temp \
    && chown -R ${UID}:${GID} /var/www/html /var/cache/nginx /var/run/nginx /var/log/nginx /var/cache/nginx/client_temp

# Expose port 80 and start Nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]