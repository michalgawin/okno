@ECHO OFF
FOR /F %i IN ('"docker ps -q -f status=exited"') DO docker rm %i