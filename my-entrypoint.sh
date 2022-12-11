mysql_chown () {
if  [ "$(id -u)" = "0" -a -n "$MYSQL_UID" -a -n "$MYSQL_GID" ];then
	echo "Changing ownership : $MYSQL_UID.$MYSQL_GID"
	usermod -u $MYSQL_UID mysql
	groupmod -g $MYSQL_GID mysql
	#chown -R mysql:mysql /var/lib/mysql-* /var/log/mysql /run/mysqld /var/lib/mysql
	chown -R mysql:mysql /run/mysqld /var/lib/mysql
fi
}
