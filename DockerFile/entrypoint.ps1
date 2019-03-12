$PSDefaultParameterValues['Out-File:Encoding'] = 'default'
if ($env:MYSQL_ROOT_PASSWORD -eq $null){
    $env:MYSQL_ROOT_PASSWORD=''
}
if ($env:MYSQL_DATA_DIR -eq $null){
    $env:MYSQL_DATA_DIR = 'C:\\mysql-5.7.25-winx64\\data'
}

Write-Output "[mysqld]" >> C:\my.ini
				"basedir=C:\\mysql-5.7.25-winx64" >> C:\my.ini
				"datadir=$env:MYSQL_DATA_DIR" >> C:\my.ini
				"port=3306" >> C:\my.ini
				"sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES " >> C:\my.ini

mysqld.exe --defaults-file=C:\my.ini --initialize-insecure;
mysqld.exe --install;
Start-Service mysql;
Stop-Service mysql;
Start-Service mysql;

mysql.exe -u root -e "UPDATE mysql.user SET authentication_string=PASSWORD('$env:MYSQL_ROOT_PASSWORD'), host='%' where user='root'; flush privileges;"
Restart-Service mysql
ping localhost -t