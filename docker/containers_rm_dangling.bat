@ECHO OFF
FOR /F %i IN ('"docker volume ls -q -f dangling=true"') DO docker rm -v %i