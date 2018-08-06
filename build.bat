@ECHO OFF

docker build --force-rm --no-cache -t michalgawin/okno-db:0.1 -f db.dockerfile .
docker build --force-rm --no-cache -t michalgawin/okno-auth:0.2 -f auth.dockerfile .
docker build --force-rm --no-cache -t michalgawin/okno-svc:0.2 -f svc.dockerfile .
