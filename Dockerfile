###########################################################################
# MYSQL image with uid/gid switch
#
###########################################################################
FROM mysql:8.0
MAINTAINER Andre van Dijk <andre.van.dijk@superclass.nl>
# Change mysql uid to match runtime user 
ENV MYSQL_UID=108
ENV MYSQL_GID=113
COPY my-entrypoint.sh /usr/local/bin 
RUN sed -i -e '2i. /usr/local/bin/my-entrypoint.sh' -e '394imysql_chown' /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
