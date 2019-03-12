# mysql-win
This is a docker image for MySQL 5.7 on Windows Server Core and it is similar to the official mysql docker images on usage.

## Environment Variables
### MYSQL_ROOT_PASSWORD
This is the same as official mysql docker image.
This variable specifies the password that will be set for the MySQL root superuser account. Without it, the password of root superuser account will be empty, which is insecure and not recommended.
### MYSQL_DATA_DIR
This variable allows you to specify the data directory of the container.
