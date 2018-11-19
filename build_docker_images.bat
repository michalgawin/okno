@ECHO OFF

rem docker build --force-rm --no-cache -t michalgawin/okno-db:0.1 -f db.dockerfile .
docker build --force-rm --no-cache -t michalgawin/okno-auth:0.3 -f auth.dockerfile .
docker build --force-rm --no-cache -t michalgawin/okno-svc:0.3 -f svc.dockerfile .
