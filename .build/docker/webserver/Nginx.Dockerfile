#==========================================================
# Nginx container
#==========================================================
# Image: https://hub.docker.com/r/library/nginx/
#==========================================================
FROM nginx
RUN apt-get update && apt-get install -y net-tools
ADD .configuration/nginx-vhost.conf  /opt/docker/vhost.conf
ADD .build/docker/webserver/index.html /var/www/html/index.html
RUN cp /opt/docker/vhost.conf /etc/nginx/conf.d/default.conf
RUN mkdir /app
RUN chmod 777 /app
EXPOSE 80
EXPOSE 8000