# my-temporal-server

docker run -d --name temporal-server \
  -p 7233:7233 \
  -e DB=mysql \
  -e MYSQL_SEEDS=<MYSQL_HOST> \
  -e MYSQL_PORT=<MYSQL_PORT> \
  -e DBNAME=temporal \
  -e DBNAME_VISIBILITY=temporal_visibility \
  -e MYSQL_USER=<MYSQL_USER> \
  -e MYSQL_PWD=<MYSQL_PASSWORD> \
  -e SKIP_SCHEMA_SETUP=false \
  temporal-server-azure:latest
