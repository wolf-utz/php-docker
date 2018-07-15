#==========================================================
# Mariadb container
#==========================================================
# Image: https://hub.docker.com/r/library/mariadb/
#==========================================================
FROM mariadb
ADD ./.docker/configuration/mysql.conf   /etc/mysql/conf.d/z99-docker.cnf
RUN chown mysql:mysql /etc/mysql/conf.d/z99-docker.cnf \
    && chmod 0644 /etc/mysql/conf.d/z99-docker.cnf